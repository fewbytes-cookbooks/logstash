#
# Cookbook Name:: logstash
# Recipe:: install
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2

Chef::Application.fatal!("install_type must be package or tarball") unless ["tarball", "package"].include? node["logstash"]["install_type"]

include_recipe "java"
include_recipe "runit"

include_recipe "logstash::install_#{node["logstash"]["install_type"]}"

directory node["logstash"]["conf_dir"] do
	mode "0755"
end

directory node["logstash"]["log_dir"] do
	mode "0755"
end

directory node["logstash"]["plugin_dir"] do
	mode "0755"
	recursive true
end

group node["logstash"]["group"] do
	system true
end

user node["logstash"]["user"] do
	system true
	gid node["logstash"]["group"]
	home node["logstash"]["home"]
	shell "/bin/true"
end

directory node["logstash"]["home"] do
	owner node["logstash"]["user"]
	group node["logstash"]["group"]
	mode "0755"
	recursive true
end
