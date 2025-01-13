public class WeatherAppController {
public String city { get; set; }
public String weatherInfo { get; set; }
public String temperature { get; set; }
public String description { get; set; }
public String humidity { get; set; }
public String pressure { get; set; }

public WeatherAppController() {
city = '';
weatherInfo = '';
temperature = '';
description = '';
humidity = '';
pressure = '';
}

public void getWeather() {
try {
// Fetch the API key from the custom setting
WeatherAPISettings__c settings = WeatherAPISettings__c.getOrgDefaults();
String apiKey = settings.API_Key__c;

// Construct the API URL
String endpoint = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&APPID=' + apiKey + '&units=metric';

// Make the HTTP callout
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(endpoint);
request.setMethod('GET');
HttpResponse response = http.send(request);

if (response.getStatusCode() == 200) {
Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
Map<String, Object> main = (Map<String, Object>) result.get('main');
List<Object> weatherList = (List<Object>) result.get('weather');
Map<String, Object> weather = (Map<String, Object>) weatherList[0];

temperature = main.get('temp').toString();
description = weather.get('description').toString();
humidity = main.get('humidity').toString();
pressure = main.get('pressure').toString();

weatherInfo = JSON.serialize(result);
} else {
weatherInfo = 'Error: Unable to fetch weather data';
}
} catch (Exception e) {
weatherInfo = 'Exception: ' + e.getMessage();
}
}
}