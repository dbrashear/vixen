require 'ffi'

module Vixen
  def self.local_connect(login = nil, password = nil)
    connect Vixen::Constants::VixServiceProvider[:vmware_workstation], nil, 0, login, password
  end

  def self.connect(host_type, hostname, port, username, password)
    handle = Vixen::Bridge.connect(host_type, hostname, port, username, password)
    Vixen::Model::Host.new(handle)
  end

end

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'vixen/constants'
require 'vixen/bridge'
require 'vixen/model/base'
require 'vixen/model/host'
require 'vixen/model/vm'
require 'vixen/model/snapshot'
