# Backend

## Prerequisites

* [.NET Core Runtime 2.2+](https://dotnet.microsoft.com/download)

## Introduction

This is a simple .net core web application, that has a REST api.
The data is served from an in-memory data-source.

## Getting Started

### Development

```bash
dotnet restore Backend.csproj
dotnet build Backend.csproj -c Release -o app
RUN dotnet publish Backend.csproj -c Release -o app
cd app
dotnet run Backend.dll
```

### Docker
```bash
docker build . -t workshop/backend
docker run -it --rm -p 8080:80 -e ASPNETCORE_URLS=http://+:5000 workshop/backend
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

The default is HTTP port is `5000`.

If you want to run the application with HTTPS you also need to add certificates to the docker-container (see: [Microsoft Documentation](https://docs.microsoft.com/en-US/aspnet/core/security/enforcing-ssl?view=aspnetcore-2.2&tabs=visual-studio#trust-the-aspnet-core-https-development-certificate-on-windows-and-macos)).

### Production / Development Environment

To set the application to a development mode, set the following environment variable:

```
ASPNETCORE_ENVIRONMENT=Development
```

This leads to more expressive stack-traces etc.
The default mode is `Development`.