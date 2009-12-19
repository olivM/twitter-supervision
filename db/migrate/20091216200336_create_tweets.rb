class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer   :twitter_id, :limit => 8
      t.string    :text
      t.string    :message
      t.string    :geo
      t.string    :from_user
      t.integer   :from_user_id, :limit => 8
      t.string    :to_user
      t.integer   :to_user_id, :limit => 8
      t.string    :profile_image_url
      t.string    :source
      t.string    :url
      t.string    :iso_language_code
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
