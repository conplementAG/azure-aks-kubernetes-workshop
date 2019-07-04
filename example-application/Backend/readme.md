# Backend

## Introduction

This is a simple .net core web application, that has a REST api.
The data is served from an in-memory data-source.

## Getting Started

```
docker build . -t workshop/backend
docker run -p 8080:80 workshop/backend
```

Browse to https://localhost:8080/api/team

Swagger is available at:

https://localhost:8080/swagger

## Configuration

The application can be configured with the following environment variables:

### TCP-Port Configuration

The HTTP and HTTPS ports can be configured by setting the following variable:

```
ENV ASPNETCORE_URLS=https://+:443;http://+:80
```

The default is HTTP port is `80`.

### Production / Development Environment

To set the application to a development mode, set the following environment variable:

```
ASPNETCORE_ENVIRONMENT=Development
```

This leads to more expressive stack-traces etc.
The default mode is `PRODUCTION`.