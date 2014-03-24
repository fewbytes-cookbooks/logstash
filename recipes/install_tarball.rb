#
# Cookbook Name:: logstash
# Recipe:: install
#
# Copyright (C) 2014 Fewbytes
# 
# Apache V2


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