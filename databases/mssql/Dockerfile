FROM mcr.microsoft.com/mssql/server:2017-CU21-ubuntu-16.04
COPY mssql-providers-command-schema-v0.1.sql /usr/src/app/providers.sql
COPY entrypoint.sh /usr/src/app/entrypoint.sh

RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P provider2020++ -i /usr/src/app/providers.sql