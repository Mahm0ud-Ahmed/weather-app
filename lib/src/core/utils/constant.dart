import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';

const String kBaseUrl = 'https://api.weatherapi.com/v1';

const String kApiKey = '3f78539781f84e279f1150815211511';

// Remote Data (APIs)
const String kWeatherMyCountry = '/current.json';
const String kForecast = '/forecast.json';
const String kSearchOfCountry = '/search.json';

//Local Data (SQLite) ==> Floor
const String kDatabaseName = 'weather.db';
const String kFavoriteTableName = 'favorite';
const String kForecastTableName = 'forecast';
const String kWeatherMyCountryTableName = 'myCountry';

// State Internet Connection
late bool hasConnection;

String? locationAddress;
String? country;
String? temperature;
String? wind;
int? forecastDays = 3;

MyCountryWeather? myCountryWeatherDB;
CountryWeather? weather;
