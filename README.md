# logstash cookbook

This is an opinionated Logstash cookbook. It works with `runit` as a service supervisor and installs one logstash service per host.

This cookbook designed with modularity and plugins in mind. It supports loading configurations and plugins placed by other cookbooks.

This cookbook is compatible with tarball bundled versions of logstash (>= 1.4.0).

# Requirements

- java (will be installed automatically)
- runit capable system (will be installed automatically)

# Usage

The cookbook uses a split configuration paradigm and is built for use with a wrapper cookbook. To load a configuration into logstash, simply place your config file in the `node["logstash"]["conf_dir"]` as follows:

    template ::File.join(node["logstash"]["conf_dir"], "25-app-logs.conf") do
        mode "0644"
        notifies :restart, "runit_service[logstash]""
    end 

Configuration files will be loaded as a concatenated file in lexical order. It's recommended (but not required) that you segragate inputs filters and outputs to different files.

In most cases you will want to use the `logstash::install` or `logstash::service` recipes, they are designed to be the building blocks of system specific logstash installations.
When you need to get a basic config up and running without too much hassle, use the `logstash::default` or `logstash::basic_config` recipes, they will install a basic configuration file provided by this cookbook, you can override using the `node["logstash"]["config_template"]["cookbook"]` and `node["logstash"]["config_template"]["source"]` attributes.

# Attributes

## General

- `node["logstash"]["install_type"]` - must be `tarball` or `package`, defaults to `package`. When set to `package` will install Logstash using yum or apt repositories.

- `node["logstash"]["user"]` - user to run logstash as, effects directory permissions as well
- `node["logstash"]["group"]` - group to run logstash as, effects directory permissions as well
- `node["logstash"]["conf_dir"]` - directory for logstash configuration files
- `node["logstash"]["home"]` - directory for logstash state files (e.g. sincedb)
- `node["logstash"]["plugin_dir"]` - base directory for extra logstash plugins
- `node["logstash"]["plugin_dirs"]` - a hash map of plugin directories to add to the plugin path. It's recommended (but not mandatory) that they be child directories of `plugin_dir`
- `node["logstash"]["gem_path"]` - a hash map of path to add to the GEM_PATH environment variable. This is required for some plugins
- `node["logstash"]["log_dir"]` - directory for logstash' internal log files logged and rotated using svlogd
- `node["logstash"]["tarball"]["url"]` - the url to download logstash from
- `node["logstash"]["tarball"]["checksum"]` - logstsash tarball checksum
- `node["logstash"]["tarball"]["version"]` - logstash version
- `node["logstash"]["contrib_tarball"]["url"]` - logstash contrib url to download from
- `node["logstash"]["contrib_tarball"]["checksum"]` - logstash contrib tarball checksum
- `node["logstash"]["contrib_tarball"]["version"]` - logstash contrib version

## Service

- `node["logstash"]["kibana"]["enabled"]` - when set to true will activate the built-in kibana instance
- `node["logstash"]["kibana"]["port"]` - the port to serve kibana on, defaults to 9292
- `node["logstash"]["heap_size"]` - java heap size for logstash, defaults to 500MB
- `node["logstash"]["java_opts"]` - A Hash map whose values are java options to run the service with
- `node["logstash"]["config"]["filterworkers"]` - number of threads to use for filters

## Basic config recipe

- `node["logstash"]["config_template"]["cookbook"]` - 
- `node["logstash"]["config_template"]["source"]` - 
- `node["logstash"]["config"]["tcp"]["port"]` - 
- `node["logstash"]["config"]["elasticsearch"]["embedded"]` - set to true to activate embedded elasticsearch
- `node["logstash"]["config"]["elasticsearch"]["cluster_name"]` - the elasticsearch cluster name, used for discovery

# Recipes

- `logstash::default` - Activate a Logstash service using the basic configuration.
- `logstash::install` - download and install logstash
- `logstash::basic_config` - write a basic config file to get you up and running fast
- `logstash::service` - install and activate Logstash service using `runit`

# Author

Author:: Avishai Ish-Shalom (<avishai@fewbytes.com>)
