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
    begin
      Twitter.update(jarrettify status[:text])
    rescue Exception, Twitter::Forbidden, Twitter::BadGateway
      # don't bother attempting to retry, just don't explode
    end
    options[:since_id] = status[:id]
  end
  sleep 30 
end 
