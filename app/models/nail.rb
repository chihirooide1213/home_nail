class Nail < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :favorites
end
