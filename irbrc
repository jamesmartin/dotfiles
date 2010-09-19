require 'rubygems'
require 'wirble'
require 'interactive_editor'
require 'pp'

Wirble.init
Wirble.colorize

# Easily print methods locally to an object's class
 class Object
   def local_methods
     (methods - Object.instance_methods).sort
   end
 end

 alias q exit
