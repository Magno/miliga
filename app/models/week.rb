class Week < ActiveRecord::Base
has_many :matches
belongs_to :tournament
end
