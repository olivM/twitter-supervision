class TermTweet < ActiveRecord::Base
  belongs_to :term
  belongs_to :tweet
end
