FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["Peacock.ManageWeb/Peacock.ManageWeb.csproj", "Peacock.ManageWeb/"]
COPY ["Peacock.ViewModel/Peacock.ViewModel.csproj", "Peacock.ViewModel/"]
COPY ["Peacock.BusinessLogic/Peacock.BusinessLogic.csproj", "Peacock.BusinessLogic/"]
COPY ["Peacock.Dal/Peacock.Dal.csproj", "Peacock.Dal/"]
RUN dotnet restore "Peacock.ManageWeb/Peacock.ManageWeb.csproj"
COPY . .
WORKDIR "/src/Peacock.ManageWeb"
RUN dotnet build "Peacock.ManageWeb.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Peacock.ManageWeb.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Peacock.ManageWeb.dll"]