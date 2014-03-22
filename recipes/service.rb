#
# Cookbook Name:: logstash
# Recipe:: service
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2
#

include_recipe "logstash::install"

runit_service "logstash"