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
