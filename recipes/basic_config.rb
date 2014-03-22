#
# Cookbook Name:: logstash
# Recipe:: basic_config
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2
#

include_recipe "logstash::install"

template ::File.join(node["logstash"]["conf_dir"], "00-logstash.conf") do
	cookbook node["logstash"]["config_template"]["cookbook"]
	source node["logstash"]["config_template"]["source"]
	mode "0644"
	notifies :restart, "runit_service[logstash]"
end
