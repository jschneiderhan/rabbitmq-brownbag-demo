RabbitMQ Demo from MYH Brownbag
===============================

Interested in running these yourself?

Follow these quick and easy steps:

Prerequisites: You must have docker and docker-compose installed

```
# Start up RabbitMQ
$ docker-compose up rabbitmq


## Direct Exchange Example

# Start up the producer
$ docker-compose run --rm app bash -c "ruby producer-direct.rb"

# In some other windows, start a few instances of the consumer:
$ docker-compose run --rm app bash -c "ruby consumer-direct.rb"


## Fanout exchange example

# Start up the producer
$ docker-compose run --rm app bash -c "ruby producer-fanout.rb"

# In some other winders, start a few instances of the consumer:
$ docker-compose run --rm app bash -c "ruby consumer-fanout.rb"

## Topic exchange example

# Start up the producer
$ docker-compose run --rm app bash -c "ruby producer-topic.rb"

# In some other winders, start a few instances of the consumer (play around with the pattern for extra fun):
$ docker-compose run --rm app bash -c "ruby consumer-topic.rb alert.debug"
```
