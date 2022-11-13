class TagMap < ApplicationRecord
  belongs_to :cook
  belongs_to :tag

  validates :cook_id, presence: true
  validates :tag_id, presence: true
end
