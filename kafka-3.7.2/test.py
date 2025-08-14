from faker import Faker
from kafka import KafkaProducer
import sys

print("Starting script...", flush=True)

# Initialize Faker
fake = Faker()
print("Faker initialized", flush=True)

# Initialize Kafka Producer
try:
    producer = KafkaProducer(
        bootstrap_servers=['localhost:9092'],
        value_serializer=lambda v: v.encode('utf-8')
    )
    print("Kafka producer initialized", flush=True)
except Exception as e:
    print(f"Failed to initialize Kafka producer: {e}", flush=True)
    sys.exit(1)

# Define the Kafka topic
topic = 'python-test'

# Generate and send fake user data to Kafka
def send_fake_user_data():
    try:
        for _ in range(10):
            user_data = f"name={fake.name()},email={fake.email()},city={fake.city()}"
            producer.send(topic, user_data)
            print(f"Sent: {user_data}", flush=True)
        producer.flush()
        print("All messages sent successfully.", flush=True)
    except Exception as e:
        print(f"Error sending data to Kafka: {e}", flush=True)
    finally:
        producer.close()
        print("Producer closed", flush=True)

if __name__ == "__main__":
    send_fake_user_data()