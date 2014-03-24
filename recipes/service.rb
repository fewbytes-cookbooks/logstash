#
# Cookbook Name:: logstash
# Recipe:: service
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2
#

include_recipe "logstash::install"

runit_service "logstash" do
	run_template_name "logstash-#{node["logstash"]["install_type"]}"
end