class Item < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  belongs_to :channel
  default_scope -> { where.not(datetime: nil).order(datetime: :desc) }

  #default_scope -> { order(datetime: nil).order(datetime: :desc) }
  #default_scope -> { order("datetime IS NULL, datetime DESC") }
  # isNotNull = self.where.not(datetime: nil).order(datetime: :desc)
  # isNull = self.where(datetime: nil)
  # default_scope -> { isNotNull + isNull }
end
