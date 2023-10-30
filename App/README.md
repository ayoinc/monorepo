# Simple Web Application

This is a simple "Hello World" web application built using Node.js and Express.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Node.js (v14 or later)
- npm (v6 or later)
- Docker (v20.10 or later)

### Installing Dependencies

Navigate to the `App` directory and install the necessary Node.js dependencies using npm:

```bash
cd ~/App
npm install
```

### Running the Application Locally

Once the dependencies are installed, you can run the application locally using the following command:

```bash
node app.js
```

The application will start, and you can access it at `http://localhost:80` in your web browser.

### Containerizing the Application

A `Dockerfile` is provided to build a Docker image of the application. Navigate to the `App` directory and build the Docker image using the following command:

```bash
docker build -t app:latest .
```

Once the image is built, you can run a container from the image using the following command:

```bash
docker run -p 80:80 app:latest
```

The application will start in a Docker container, and you can access it at `http://localhost:80` in your web browser.

## Authors

- **Ayodele Ajayi** - *Initial work* - [Ayodele Ajayi](https://github.com/ayoinc/monorepo)

See also the list of [contributors](https://github.com/ayoinc/monorepo/contributors) who participated in this project.

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc
