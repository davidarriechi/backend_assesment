"""API that services requests for sprocket factory data and sprockets"""

import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

POSTGRES_USER = os.environ.get("POSTGRES_USER")
POSTGRES_PASSWORD = os.environ.get("POSTGRES_PASSWORD")
POSTGRES_DB = os.environ.get("POSTGRES_DB")
POSTGRES_HOST = os.environ.get("DB_HOST")

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{POSTGRES_USER}:' \
                f'{POSTGRES_PASSWORD}@{POSTGRES_HOST}:5432/{POSTGRES_DB}'
db = SQLAlchemy(app)


class Factory(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=True)


class ChartData(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    factory_id = db.Column(db.Integer, nullable=False)
    sprocket_production_actual = db.Column(db.Integer, nullable=False)
    sprocket_production_goal = db.Column(db.Integer, nullable=False)
    time = db.Column(db.BigInteger, nullable=False)


class Sprocket(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    teeth = db.Column(db.Integer, nullable=False)
    pitch = db.Column(db.Integer, nullable=False)
    outside_diameter = db.Column(db.Integer, nullable=False)
    pitch_diameter = db.Column(db.Integer, nullable=False)

    def _serialize(self):
        return {
            'id': self.id,
            'teeth': self.teeth,
            'pitch': self.pitch,
            'outside_diameter': self.outside_diameter,
            'pitch_diameter': self.pitch_diameter
        }


@app.route('/factories', methods=['GET'])
def get_factories():
    factory_list = db.session.query(ChartData).all()

    if not factory_list:
        return jsonify({"error": "There are no factories"}), 404

    response = {
        "factories": []
    }

    result = {}
    for factory in factory_list:
        if factory.factory_id not in result:
            result[factory.factory_id] = {
                "factory_id": factory.factory_id, 
                "chart_data": {
                    "sprocket_production_actual": [],
                    "sprocket_production_goal": [],
                    "time": []
                            }}
        result[factory.factory_id]["chart_data"]["sprocket_production_actual"]\
            .append(factory.sprocket_production_actual)
        result[factory.factory_id]["chart_data"]["sprocket_production_goal"]\
            .append(factory.sprocket_production_goal)
        result[factory.factory_id]["chart_data"]["time"].append(factory.time)

    for _, value in result.items():
        response["factories"].append({"factory": value})

    return jsonify(response)


@app.route("/factories/<int:factory_id>", methods=['GET'])
def get_factory_data(factory_id):
    factory_data_list = db.session.query(ChartData)\
        .filter_by(factory_id=factory_id).all()

    if not factory_data_list:
        return jsonify({"error": "Factory not found"}), 404

    response = {
        "factory_id": factory_id,
    }

    actual_production_list = []
    goal_production_list = []
    time_list = []

    for factory_data in factory_data_list:
        actual_production_list.append(factory_data.sprocket_production_actual),
        goal_production_list.append(factory_data.sprocket_production_goal),
        time_list.append(factory_data.time)

    response["chart_data"] = {
        "sprocket_production_actual": actual_production_list,
        "sprocket_production_goal": goal_production_list,
        "time": time_list,
    }

    return jsonify(response)


@app.route('/sprockets/<int:sprocket_id>', methods=['GET'])
def get_sprockets(sprocket_id):
    sprockets = Sprocket.query.filter_by(id=sprocket_id).first()
    if sprockets is None:
        return jsonify({'message': 'Sprocket not found'}), 404
    return jsonify(sprockets._serialize()), 200


@app.route('/sprockets', methods=['POST'])
def create_sprocket():
    teeth = request.json['teeth']
    pitch = request.json['pitch']
    outside_diameter = request.json['outside_diameter']
    pitch_diameter = request.json['pitch_diameter']
    sprocket = Sprocket(teeth=teeth,
                        pitch=pitch,
                        outside_diameter=outside_diameter,
                        pitch_diameter=pitch_diameter)
    db.session.add(sprocket)
    db.session.commit()
    return jsonify(sprocket._serialize()), 201


@app.route('/sprockets/<int:sprocket_id>', methods=['PUT'])
def update_sprocket(sprocket_id):
    sprocket = Sprocket.query.get_or_404(sprocket_id)
    sprocket.teeth = request.json['teeth']
    sprocket.pitch = request.json['pitch']
    sprocket.outside_diameter = request.json['outside_diameter']
    sprocket.pitch_diameter = request.json['pitch_diameter']
    db.session.commit()
    return jsonify(sprocket._serialize())


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
