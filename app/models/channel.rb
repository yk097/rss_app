class Channel < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  has_many :items
end
