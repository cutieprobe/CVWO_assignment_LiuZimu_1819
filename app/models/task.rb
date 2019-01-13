class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  acts_as_taggable_on :tags
end
