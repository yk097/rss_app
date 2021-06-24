class Item < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  belongs_to :channel
  default_scope -> { where.not(datetime: nil).order(datetime: :desc) }
end
