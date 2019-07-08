# Frontend

## Prerequisites

* [node.js v10.X](https://nodejs.org/en/download/)

## Introduction

This is a very simple node.js application, that provides a react.js UI with express.

It shows the following principals:

* Configuration with environment variables
* Ajax Requests to a backend service for loading data

## Getting Started

### Development

```bash
npm install
npm start
```

Browse to http://localhost:3000

### Docker

```bash
docker build . -t workshop/frontend
docker run -it --rm -p 8082:80 -e PORT=80 -e COLOR=green workshop/frontend
```

Browse to http://localhost:8082

## Configuration

The application can be configured with the following environment variables:

### Color

There is a colorized box in the UI. The color of this box can be adjusted by the environment variable `COLOR`.

```bash
COLOR=green
# or
COLOR="#00ff00"
```

### HTTP Port

The HTTP port can be configured by setting the following variable:

```
PORT=80
```

The default is HTTP port is `3000`.

### Version

The version of the application is displayed in the UI.

```bash
VERSION=1.0.1.0
```

The default version is `0.0.0.0`.

### Backend Url

To communicate with the backend and load data, the application performs ajax requests. The url where the backend can be reached can be configured with the environment variable `BACKEND_HOST`.

```
BACKEND_HOST=https://localhost:8081
```

The default backend url is `http://localhost:8080`.