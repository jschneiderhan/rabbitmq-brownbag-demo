RabbitMQ Demo from MYH Brownbag
===============================

Interested in running these yourself?

Follow these quick and easy steps:

Prerequisites: You must have docker and docker-compose installed

```
# Start up RabbitMQ
$ docker-compose up rabbitmq
```

You should now be able to access the RabbitMQ management console
at http://localhost:8080. If you're using boot2docker, you'll
need to use the output of `boot2docker ip` instead of localhost.
The default username/password is `guest`/`guest`. 


Direct Exchange Example
-----------------------

The Direct exchange example sets up a single Queue and binds
to the default exchange, which uses the Queue name as a
routing key. Multiple workers connect to the Queue, so
Consumers receive messages in a round-robin fashion.

```

# Start up the producer
$ docker-compose run --rm app bash -c "ruby producer-direct.rb"

# In some other windows, start a few instances of the consumer:
$ docker-compose run --rm app bash -c "ruby consumer-direct.rb"
```


```
## Fanout exchange example

The Fanout Exchange leaves the Consumers to create the Queue,
meaning that messages will be blackhold when no Consumers
are subscribed. The Consumers create Queues with an empty
string (so RabbitMQ assigns a random name) and binds to
the exchange. All Consumers get all messages.

# Start up the producer
$ docker-compose run --rm app bash -c "ruby producer-fanout.rb"

# In some other winders, start a few instances of the consumer:
$ docker-compose run --rm app bash -c "ruby consumer-fanout.rb"
```

```
## Topic exchange example

The Topic exchange also leaves the Consumers to create the Queue,
meaning that messages will be blackhold when no Consumers
are subscribed. The Consumers create Queues with an empty
string (so RabbitMQ assigns a random one) and binds with a
pattern. Queues only receive messages with routing keys that
match the pattern.

```
# Start up the producer
$ docker-compose run --rm app bash -c "ruby producer-topic.rb"

# In some other winders, start a few instances of the consumer (play around with the pattern for extra fun):
$ docker-compose run --rm app bash -c "ruby consumer-topic.rb alert.debug"
```
