#!/usr/bin/ruby
# IRB commandline utilities
require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

# Data parsing utilities
require 'yaml'
require 'json/ext'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

class Hash
  def print_sorted
    self.to_a.sort_by(&:last).reverse_each { |x| print "#{x}\n" }
  end
end

class Object
  # list interesting methods of class
  def interesting_methods
    (self.methods - Object.methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

# Enable Wirble if it's available
begin 
  # load and initialize wirble
  require 'wirble'
  Wirble.init
  
  #
  # Uncomment the line below to enable Wirble colors.
  # 

  Wirble.colorize
rescue LoadError => err
  # Ignore
  # warn "Couldn't load Wirble: #{err}"
end
