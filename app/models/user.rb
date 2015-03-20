class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  ROLES = %w(admin normal)

  has_many :results, dependent: :destroy

  validates :name, presence: true, length: {maximum:50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :role, presence: true, inclusion: {in: ROLES}
  validate :avatar_size

  ROLES.each do |role|
    define_method("is_#{role}?") do
      self.role == role
    end
  end

  private
  def avatar_size
    errors.add(:avatar, "should be less than 1MB") if avatar.size > 1.megabytes
  end
end
