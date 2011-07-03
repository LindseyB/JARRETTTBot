require "rubygems"
require "twitter"
require_relative "config.rb"

client = Twitter::Client.new
options = {}

options[:since_id] = Twitter.user_timeline("JarrettB").first[:id]

# make text jarretty
def jarrettify text
  text.upcase!
  text = text.gsub(/!/, "!!!") || text
  text = text.gsub(/\?/, "!?!") || text
end

while true do 
  Twitter.user_timeline("JarrettB", options).each do |status|
    Twitter.update(jarrettify status[:text])
    options[:since_id] = status[:id]
  end
  sleep 30 
end 
