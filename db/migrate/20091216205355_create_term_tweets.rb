class CreateTermTweets < ActiveRecord::Migration
  def self.up
    create_table :term_tweets do |t|
      t.integer :term_id
      t.integer :tweet_id
      t.timestamps
    end
  end

  def self.down
    drop_table :term_tweets
  end
end
