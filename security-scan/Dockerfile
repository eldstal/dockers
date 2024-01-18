FROM mcr.microsoft.com/dotnet/sdk:6.0-focal

RUN dotnet tool install --global security-scan --version 5.6.7

RUN mkdir /app
WORKDIR /app

ENTRYPOINT [ "/root/.dotnet/tools/security-scan" ]
CMD [ "-help" ]
