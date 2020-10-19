class Nail < ApplicationRecord
	attachment :nail_image
	belongs_to :user
	has_many :favorites
end
