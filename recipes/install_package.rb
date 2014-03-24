case node.platform_family
when "debian"
	include_recipe "apt"

	apt_repository "logstash-1.4" do
		uri node["logstash"]["apt_repository"]["url"]
		key node["logstash"]["apt_repository"]["gpg_key_url"]
		components ["main"]
		distribution "stable"
		action :add
	end
	package "logstash"
	package "logstash-contrib"
when "rhel"
	include_recipe "yum"
	
	yum_repository "logstash-1.4" do
		description "logstash repository for 1.4.x packages"
		baseurl node["logstash"]["yum_repository"]["url"]
		gpgkey node["logstash"]["yum_repository"]["gpg_key_url"]
		action :create
	end
	package "logstash"
	package "logstash-contrib"
else
	include_recipe "logstash::install_tarball"
end

