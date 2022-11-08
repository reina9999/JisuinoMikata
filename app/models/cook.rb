class Cook < ApplicationRecord

  has_one_attached :image

  belongs_to :customer
  validates :name, presence: true
  validates :required_time, presence: true
  validates :foods, presence: true
  validates :recipe, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image
  end
  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end
end


