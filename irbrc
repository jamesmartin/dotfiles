require 'rubygems'
require 'interactive_editor'
require 'wirble'
require 'pp'

Wirble.init
Wirble.colorize

class Object
  def local_methods
    (methods - Object.instance_methods.sort)
  end
end
