require 'rubygems'
require 'mongo'

$client= Mongo::Client.new(['127.0.0.1:27017'],:database=> 'tutorial')
Mongo:: Logger.logger.level=::Logger::ERROR
$user =$client[:users]
puts 'connected!'
