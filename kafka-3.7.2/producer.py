from kafka import KafkaProducer # KafkaProducer is used to send messages to a Kafka topic
import requests # Used to make HTTP requests to the OpenWeatherMap API
import json #Used to format Python dictionaries into JSON for Kafka to send
import time

# 1. Set up Kafka producer
producer = KafkaProducer(
    bootstrap_servers='localhost:9092', # The is where kafka server is running
    value_serializer=lambda v: json.dumps(v).encode('utf-8') #JSON encodes the data before sending it to Kafka
)

# 2. Kafka topic name
topic = 'python-test'

# 3. API key for OpenWeatherMap
api_key = 'b9cf14ad9648a95f592ba31946fcca4a' #stores api key

# 4. List of cities to fetch weather
cities = [
    {"name": "Nairobi", "country": "KE"},
    {"name": "Mombasa", "country": "KE"},
    {"name": "Kisumu", "country": "KE"},
    {"name": "Nakuru", "country": "KE"},
    {"name": "Eldoret", "country": "KE"}
] 

# 5. Function to fetch weather data from the API
def fetch_weather(city, country): #defines a function that takes a city and country as parameters
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city},{country}&appid={api_key}&units=metric" # Constructs the URL for the API request
    response = requests.get(url) # Sends a GET request to the OpenWeatherMap API
    if response.status_code == 200: # Checks if the request was successful
        weather = response.json()  # if successful, data is extracted
        return {
            'city': weather['name'],
            'temperature': weather['main']['temp'],
            'humidity': weather['main']['humidity'],
            'timestamp': time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(weather['dt']))
        } # Returns a dictionary with the city name, temperature, humidity, and timestamp
    
    else: 
        print(f"Failed to fetch weather for {city}, status code: {response.status_code}")
        return None

# 6. Main loop to stream data to Kafka
if __name__ == "__main__": # runs when the script is executed directly
    while True: # A continues loop that fetches weather data for each city
        for city in cities: #iterates or loops through each city in the given list 
            weather_data = fetch_weather(city["name"], city["country"]) #function call <fetch weather data for the current city>
            if weather_data: # Checks if fetch was successful
                producer.send(topic, weather_data) #Sends to the Kafka topic
                print(f"Sent: {weather_data}") # Prints the sent weather data
            time.sleep(2)  # Defines a delay of 2 second between requests