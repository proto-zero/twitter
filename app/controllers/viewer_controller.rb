class ViewerController < ApplicationController

  def index
    @topics = Topic.all
  end


  def show
    @topics = Topic.all
    @topic = Topic.find(params[:id])

    Post.all.each do |post|
      post.destroy
    end

    @client = Tweetkit::Client.new do |config|
      config.bearer_token = 'AAAAAAAAAAAAAAAAAAAAAPj4bQEAAAAAc%2F0OfNUM6%2BHKsCANm02p0a%2BBHzo%3DqrIE0wH82RA4BDvMp8mZLJLLawXFMskuPrvQmA1nR26HdSQJmy'
      config.consumer_key = 'YW75U8m19RMxfJ18KfUCim4ps'
      config.consumer_secret = 'vhexeXmug2FqQAY6CCguomHn3t3Imy2vWXNQiRNKnCd0ZHcEWd'
    end

    posts = @client.search("#{@topic.title}").take(10)
    posts.each do |post|
      tweet = Post.new
      tweet.body = post.text
      tweet.topic_id = @topic.id
      tweet.save
    end

    @posts = Post.all
  end
end
