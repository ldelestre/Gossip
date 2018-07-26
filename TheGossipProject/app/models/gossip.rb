class Gossip < ApplicationRecord
	belongs_to :user, required: false
	has_many :tags
	has_many :commentaires
end
