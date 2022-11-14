class Customer < ApplicationRecord
  has_many :cooks
  has_many :bookmarks,dependent: :destroy
  has_many :cook_comments, dependent: :destroy
  # has_many :cooks, through: :bookmarks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

    # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(name: 'guestcustomer' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = 'guestcustomer'
    end
  end
end
