class Cook < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :bookmarks,dependent: :destroy
  has_many :cook_comments, dependent: :destroy
  has_many :cook_tags, dependent: :destroy
  belongs_to :tag

  validates :name, presence: true
  validates :required_time, presence: true
  validates :foods, presence: true
  validates :recipe, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(rate: :desc)}


  def bookmarked_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image
  end

  def self.looks(search, word)
    if search == "perfect_match" #完全一致
      @cook = Cook.where("name LIKE?","#{word}")
    elsif search == "partial_match" #部分一致
      @cook = Cook.where("name LIKE?","#{word}%")
    else
      @cook = Cook.all
    end
  end
end


