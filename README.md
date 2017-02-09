Elastic Stack Ninja
====================

*Hi there!*

I want to introduce the Elastic Stack Ninja.

This project is meant to keep up and runing an Elastic Stack for logging centralization and visualization, only for ninjas. =D

### What do we have in this stack?

Elasticsearch 5.2, Kibana 5.2 and Beats.


### Where is Logstash? You may ask.

Logstash is a high server-side data processing pipeline, that we know its power, but keeping in mind to keep simple, we are using beats (filebeat) to send logs direclty to Elasticsearch.

Filebeat is a robust and lightweight shipper that has a lot of features like decode json, mutate, etc so we send logs already parsed or/and Json decoded.

We are using the version 5.2 of Elasticsearch and Kibana.

#### Infraestructure ####

For dev/poc environment we used Vagrant. In a production ready, We create a code for our infraestructure using terraform. This terraform recipe create a autoscale group for the stack.

#### Provisioning ####

We are provisioning this stack using Chef Solo. Chef Solo is a lightweight alternative for provisioning, dispensing a server (Chef Server). Along with chef-solo, Berkshelf for resolv cookbooks dependencies.

We tried to use community cookbooks (reliable, maintened and well documented) as maximum possible. We only had to create 2 cookbooks: elastic_ninja and kibana_ninja who depends from some community cookbooks like java, apt, elasticsearch...

#### Security ####

In a production architeture it's a good idea to take security in place. The ideal scenario is shipping logs in a encripted ssl connection between filebeat and elsticsearch, kibana and Elasticsearch and a shield plugin for autentication on a Kibana.

Scaling As the production environment is designed to be created in a autoscale group, we can easily scale up nodes into elasticsearch cluster, in case of peak of logging.

## Running the Elastic Stack  poc/dev. ##

To run this evironment CLONE this repo

```
git clone https://github.com/jroliv/appninja.git
```
and **execute the lines command on the root project folder**:

```bash
$ vagrant up
$ cd NinjagenLog
$ docker build -t log_generator .
$ docker run -it --add-host elastic:YOUR_IP_ADDRESS --name ninja_log_gen-v0.1 log_generator
 ```



**IMPORTANT: change the YOUR_IP_ADDRESS per your host IP, so the docker (filebeat) is able to send events logs to elastic stack (vagrant)**

The vagrant machine is the Elastic Stack
Docker image is the filebeat being sending logs to Elastic Stack.

### Accessing Kibana ###

And finally, to us be able view the log events we must to access **Kibana**.

Access at your browser:

[http://localhost:5601](http://localhost:5601)

Kibana asks to set the **appropriate index name**.

Please enter the **"filebeat\*"** string on that field.

Finally, chose the **@timestamp** field and **navigate the logs.**

Thanks very much!
