class User < ApplicationRecord
	belongs_to :ville, required: false
	has_many :gossips
	has_many :commentaires
end
