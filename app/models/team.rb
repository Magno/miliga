class Team < ActiveRecord::Base
has_many :players
has_many :tournaments
has_many :weeks
belongs_to :league
has_many :matches
belongs_to :match
end
