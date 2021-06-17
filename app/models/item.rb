class Item < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  belongs_to :channel
end
