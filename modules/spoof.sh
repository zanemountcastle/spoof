#! /bin/bash

# Spoof MAC address to circumvent most timeout-based freemium internet providers in airports, hotels, cafes, etc.
# Spoof works by changing your computer’s MAC address so it is recognised as a new internet service user by the internet provider.

if [ “$1” == “-h” -o “$1” == “-help” ] 
then 
	echo spoof - A simple script for circumventing most timeout-based free internet services by changing the identifier the services use, i.e. your computer’s MAC address.
	echo Simply run spoof after internet service timeout to initiate a new session.
else
	OLD_MAC_ADDRESS=$(ifconfig en1 |grep ether | grep -oE [0-9abcdef:]{17})
	NEW_MAC_ADDRESS=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')

	echo Old MAC Address: $OLD_MAC_ADDRESS

	sudo ifconfig en0 ether $NEW_MAC_ADDRESS

	echo MAC address successfully changed
	echo New MAC Address: $NEW_MAC_ADDRESS
	echo Happy surfing!
fi



