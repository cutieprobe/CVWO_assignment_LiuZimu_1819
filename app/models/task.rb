class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  acts_as_taggable_on :tags
  scope :by_join_date, -> {order("created_at DESC")}
end
