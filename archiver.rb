$LOAD_PATH << File.dirname(__FILE__)
require "rubygems"
require "mongo"
require "twitter"
require "config"

class TweetArchiver
  def initialize(tag)
    client = Mongo::Client.new(["#{DATABASE_HOST}:#{DATABASE_PORT}"], :database => "#{DATABASE_NAME}")
    @tweets = client["#{COLLECTION_NAME}"]
    @tweets.indexes.drop_all
    @tweets.indexes.create_many([
      {:key => {tags: 1}},
      {:key => {id: -1}},
    ])
    @tag = tag
  end
end
