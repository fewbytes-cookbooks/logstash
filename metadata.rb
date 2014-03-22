name             'logstash'
maintainer       'Avishai Ish-Shalom'
maintainer_email 'avishai@fewbytes.com'
license          'Apache V2'
description      'Installs/Configures logstash'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "ark"
depends "java"
depends "runit"