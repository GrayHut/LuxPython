from faker import Faker
from kafka import KafkaProducer

# Initialize Faker
fake = Faker()

# Initialize Kafka Producer
producer = KafkaProducer(
    bootstrap_servers=['localhost:9092'],
    value_serializer=lambda v: v.encode('utf-8')
)

# Define the Kafka topic
topic = 'python-test'

# Generate and send fake user data to Kafka
def send_fake_user_data():
    try:
        for _ in range(10):
            user_data = f"name={fake.name()},email={fake.email()},city={fake.city()}"
            producer.send(topic, user_data)
            print(f"Sent: {user_data}")
        producer.flush()
        print("All messages sent successfully.")
    except Exception as e:
        print(f"Error sending data to Kafka: {e}")
    finally:
        producer.close()

if __name__ == "__main__":
    send_fake_user_data()