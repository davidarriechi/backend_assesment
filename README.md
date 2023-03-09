# Backend Assesment
This is a simple app that services requests for sprocket factory data and sprockets. You can use Docker Compose to stand up the database and app without having to install any dependencies on your local machine.

## Prerequisites
To run the app using Docker Compose, you need to have Docker and Docker Compose installed on your machine.

- Docker
- Docker Compose

## How to Run
To run the app using Docker Compose, follow these steps:

1. Clone the repository to your local machine:

    `git clone https://github.com/davidarriechi/backend_assesment.git`

2. Navigate to the project directory:

    `cd backend_assesment`

3. Start the app using Docker Compose:

    `docker-compose up`

   This will start the app and the database in separate containers.

4. Access the app in your web browser at http://localhost:5001

5. When you're done, stop the app by running the following command:

    `docker-compose down`

   This will stop and remove the containers.
