FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY Backend.csproj .
RUN dotnet restore Backend.csproj
COPY . .
WORKDIR /src
RUN dotnet build Backend.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Backend.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .

ENV ASPNETCORE_URLS=http://+:5000

ENTRYPOINT ["dotnet", "Backend.dll"]
