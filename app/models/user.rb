class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :results, dependent: :destroy

  validates :name, presence: true, length: {maximum:50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validate :avatar_size

  def is_admin?
    self.role == 'admin'
  end

  private
  def avatar_size
    errors.add(:avatar, "should be less than 1MB") if avatar.size > 1.megabytes
  end
end
