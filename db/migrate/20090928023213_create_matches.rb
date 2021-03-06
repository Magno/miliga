class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :week_id
      t.integer :localteam
      t.integer :visitteam
      t.date :matchdate
      t.datetime :matchtime

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
