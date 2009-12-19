class Term < ActiveRecord::Base

  has_many :tweets, :through => :term_tweets
  has_many :term_tweets

  def get_page(page_nb)
    # http://search.twitter.com/search?lang=fr&page=2&q=h1n1+OR+grippe
    url = "http://search.twitter.com/search?lang=fr&q=#{self.name}&page=#{page_nb}"
  end
  
  def get_next_page
    next_page = self.last_page + 1
    self.get_page(next_page)
    self.last_page = next_page
    self.save
  end


end
