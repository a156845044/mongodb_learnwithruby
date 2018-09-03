$LOAD_PATH << File.dirname(__FILE__)
require "rubygems"
require "mongo"
require "twitter"
require "config"

class TweetArchiver
  #创建Tweet-Archiver 实例
  def initialize(tag)
    client = Mongo::Client.new(["#{DATABASE_HOST}:#{DATABASE_PORT}"], :database => "#{DATABASE_NAME}")
    @tweets = client["#{COLLECTION_NAME}"]
    @tweets.indexes.drop_all
    @tweets.indexes.create_many([
      {:key => {tags: 1}},
      {:key => {id: -1}},
    ])
    @tag = tag
    @tweets_found = 0

    #使用 config.rb 中的值配置
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "#{API_KEY}"
      config.consumer_secret = "#{API_SECRET}"
      config.access_token = "#{ACCESS_TOKEN}"
      config.access_token_secret = "#{ACCESS_TOKEN_SECRET}"
    end
  end

  #保存 save_tweets_for 的方法
  def update
    puts "Starting Twitter search for '#{@tag}'..."
    save_tweets_for(@tag)
    print "#{@tweets_found} Tweets saved.\n\n"
  end

  #使用Twitter搜索引并保存结果到Mongo
  private

  def save_tweets_for(term)
    @client.search(term).each do |tweet|
      @tweets_found += 1
      tweet_doc = tweet.to_h
      tweet_doc[:tags] = term
      tweet_doc[:_id] = tweet_doc[:_id]
      @tweets.insert_one(tweet_doc)
    end
  end
end
