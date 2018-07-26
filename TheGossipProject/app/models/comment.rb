class Comment < ApplicationRecord
	belongs_to :gossip, required: false
	belongs_to :user, required: false
end
