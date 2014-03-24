require 'spec_helper'

describe service("logstash") do
	it { should be_running }
end

describe process("java") do
	its(:args) { should match /.*logstash.*/ }
end

describe user("logstash") do
	it { should exist }
	it { should have_login_shell("/bin/true") }
end

describe port(5559) do
	it { should be_listening.with("tcp") }
	it { should be_listening.with("udp") }
end

# elasticsearch
describe port(9200) do
	it { should be_listening.with("tcp") }
end

# kibana
describe port(9292) do
	it { should be_listening.with("tcp") }
end
