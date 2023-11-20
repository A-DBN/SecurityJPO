#!/bin/bash

nmap $1 | sed '/Nmap scan report for/d' | sed '/rDNS record for/d'