#
# Cookbook Name:: logstash
# Recipe:: install
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2

include_recipe "java"
include_recipe "runit"
include_recipe "ark"


ark "logstash" do
	url node["logstash"]["tarball"]["url"]
	checksum node["logstash"]["tarball"]["checksum"]
	version node["logstash"]["tarball"]["version"]
	has_binaries ["bin/logstash"]
	action :install
end

ark "logstash-contrib" do
	url node["logstash"]["contrib_tarball"]["url"]
	checksum node["logstash"]["contrib_tarball"]["checksum"]
	version node["logstash"]["contrib_tarball"]["version"]
	action :install
end

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
