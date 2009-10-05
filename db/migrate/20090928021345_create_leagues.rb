class CreateLeagues < ActiveRecord::Migration
  def self.up
    create_table :leagues do |t|
      t.integer :user_id
      t.string :leaguename
      t.string :leaguesubdomain

      t.timestamps
    end
  end

  def self.down
    drop_table :leagues
  end
end
