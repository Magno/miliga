class Tournament < ActiveRecord::Base
has_many :weeks
has_many :teams
belongs_to :league
end
