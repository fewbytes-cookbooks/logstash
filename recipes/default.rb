#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2
#

include_recipe "logstash::basic_config"
include_recipe "logstash::service"

