class Term < ActiveRecord::Base

  has_many :tweets, :through => :term_tweets
  has_many :term_tweets

  #via twitter API
  def get_recent
    require 'twitter'
    
    since = self.tweets.maximum('twitter_id')
    pp "since : #{since}"
    search = Twitter::Search.new(self.name).per_page(100).lang('fr').since(since)
    page = 1
    begin
      pp "page #{page}"
      results = search.page(page).fetch(true).results
      results.each do |result|
        result.twitter_id = result.id
        result.sent_at = result.created_at
        tweet = Tweet.find_or_create_by_twitter_id(result)
        self.tweets << tweet
      end
      page = page + 1
    end while results.count > 1

    nil

  end

  def get_older
    until_date = self.tweets.minimum('sent_at').strftime("%Y-%m-%d")
    pp "until : #{until_date}"
    search = Twitter::Search.new(self.name).per_page(100).lang('fr').until_date(until_date)
    pp search.query
    page = 1
    begin
      pp "page #{page}"
      results = search.page(page).fetch(true).results
      unless results.nil?
        results.each do |result|
          result.twitter_id = result.id
          result.sent_at = result.created_at
          tweet = Tweet.find_or_create_by_twitter_id(result)
          self.tweets << tweet
        end
      end
      page = page + 1
    end while ! results.nil? and results.count > 1
  end

  # via twitter scraping
  def get_page(page_nb)
    # http://search.twitter.com/search?lang=fr&page=2&q=h1n1+OR+grippe&rpp=50
    url = "http://search.twitter.com/search?lang=fr&rpp=50&q=#{self.name}&page=#{page_nb}"
    puts url
    
    require 'open-uri'
    doc = open(url) { |f| Hpricot(f) }

    (doc/".result").each do |res|
      puts (res/".avatar img")[0].attributes['src']
    end
    
  end
  
  def get_next_page
    next_page = self.last_page + 1
    self.get_page(next_page)
    self.last_page = next_page
    self.save
  end
  
  def reset_page
    self.last_page = 0
    self.save
    self
  end
  
  # via google
  def get_olders
  end


end
