class Tweet < ActiveRecord::Base

  has_many :terms, :through => :term_tweets
  has_many :term_tweets

  
end
