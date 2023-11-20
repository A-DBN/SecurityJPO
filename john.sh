#!/bin/bash

p1=$(echo -n "rainbow" | md5sum | awk '{print $1}')
p2=$(echo -n "bulldog19" | md5sum | awk '{print $1}')

echo "user1:$p1" > passwords.txt
echo "user2:$p2" >> passwords.txt

john --show --format=raw-md5 passwords.txt
