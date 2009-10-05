class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :team_id
      t.string :playername
      t.string :playeremail
      t.integer :playerphonenumber

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
