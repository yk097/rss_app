class Channel < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  has_many :items
end
