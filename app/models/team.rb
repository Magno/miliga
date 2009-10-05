class Team < ActiveRecord::Base
has_many :players
has_many :matches
has_many :tournaments
has_many :weeks
end
