class Cook < ApplicationRecord

  has_one_attached :image

  belongs_to :customer
  has_many :bookmarks,dependent: :destroy
  has_many :cook_comments, dependent: :destroy
  has_many :tag_maps,dependent: :destroy
  has_many :tags, through: :tagmaps

  validates :name, presence: true
  validates :required_time, presence: true
  validates :foods, presence: true
  validates :recipe, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

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

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    p current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_cook_tag = Tag.find_or_create_by(name: new)
      self.tag << new_cook_tag
    end
  end


  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end
end


