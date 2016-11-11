# RF24Gateway -- examples/addons/mqttLogger.py
#
# (c) 2016 Gerad Munsch <gmunsch@unforgivendevelopment.com>
# (c) 2016 TMRh20
#
# DESCRIPTION:
# This example is a simple, MQTT-based data logger. It listens on localhost for
# UDP output from RF24Gateway, and logs that received data to an MQTT topic.
# It is especially useful for RF24Mesh nodes which are unable to communicate in
# a direct manner, with standard protocols, such as TCP/IP.
#
# PREREQUISITES:
# This code requires paho-mqtt (a Python library for MQTT)
#
# The "universal" method for installation is as such:
# # sudo pip-install paho-mqtt
#
# However, many distributions may provide their own, pre-packaged binaries, able
# to be installed with the system package manager.
#
# USAGE:
# See RF24Gateway examples: 
#                            RF24NetworkFrame frame = RF24NetworkFrame(header,buf,size); 
#                            gw.sendUDP(mesh.getNodeID(header.from_node),frame);
#

# -*- coding: utf-8 -*-
import paho.mqtt.client as mqtt
import socket
import sys

reload(sys) 
sys.setdefaultencoding('utf8')

### Setup the MQTT host IP & topic to publish to
mqttHost = "10.10.2.2"
topic = 'data/RF24'

### Bind to UDP port 32001 (default port of RF24Gateway UDP output)
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_address = ('localhost', 32001)
print >>sys.stderr, 'Waiting for UDP message on %s port %s\n' % server_address
sock.bind(server_address)

while True:

    data, address = sock.recvfrom(2048)
    
    print >>sys.stderr, 'received %s bytes from %s' % (len(data), address)
    print >>sys.stderr, data
    
    if data:
        ## Just log the entire chunk of data to MQTT for now
        ## Todo: Sort, Display and Analyze the data
        mqttc = mqtt.Client()
        mqttc.connect(mqttHost, 1883)
        data = unicode(data, errors='replace')
        mqttc.publish(topic, data)
        mqttc.loop(2)