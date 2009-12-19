class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :name
      t.integer :last_page, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :terms
  end
end
