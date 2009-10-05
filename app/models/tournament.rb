class Tournament < ActiveRecord::Base
has_many :weeks
has_many :teams
end
