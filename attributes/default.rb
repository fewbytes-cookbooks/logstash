include_attribute "ark"

default["logstash"]["tarball"]["url"] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.4.0.tar.gz"
default["logstash"]["tarball"]["version"] = "1.4.0"
default["logstash"]["tarball"]["checksum"] = "ab62394bb56da10cb20ee106badf22734402b21435977ec4f9aa65257627c629"
default["logstash"]["contrib_tarball"]["url"] = "http://download.elasticsearch.org/logstash/logstash/logstash-contrib-1.4.0.tar.gz"
default["logstash"]["contrib_tarball"]["checksum"] = "23aa397a7832d6e3553eba8360ff5d4ccfff98aac1e4a1b8201c21755e8d77c9"
default["logstash"]["contrib_tarball"]["version"] = "1.4.0"

default["logstash"]["user"] = "logstash"
default["logstash"]["group"] = "logstash"

default["logstash"]["conf_dir"] = "/etc/logstash"
default["logstash"]["home"] = "/var/lib/logstash/home"
default["logstash"]["plugin_dir"] = "/var/lib/logstash/plugins"
default["logstash"]["log_dir"] = "/var/log/logstash"
default["logstash"]["plugin_dirs"] = Hash.new

default["logstash"]["config_template"]["cookbook"] = "logstash"
default["logstash"]["config_template"]["source"] = "logstash.conf.erb"

default["logstash"]["heap_size"] = "500m"
default["logstash"]["java_opts"] = Hash.new
default["logstash"]["filterworkers"] = 1

default["logstash"]["kibana"]["enabled"] = false
default["logstash"]["kibana"]["port"] = 9292

default["logstash"]["config"]["tcp"]["port"] = 5559
default["logstash"]["config"]["udp"]["port"] = 5559
default["logstash"]["config"]["elasticsearch"]["embedded"] = true

default["logstash"]["gem_path"]["logstash"] = ::File.join(ark["prefix_home"], "logstash", "vendor", "bundle", "jruby", "1.9")
default["logstash"]["gem_path"]["logstash-contrib"] = ::File.join(ark["prefix_home"], "logstash-contrib", "vendor", "bundle", "jruby", "1.9")