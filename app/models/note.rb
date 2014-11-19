class Note < ActiveRecord::Base
	validates :content, presence: true
	default_scope -> { order('created_at DESC') }

	belongs_to :thing
end
