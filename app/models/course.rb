class Course < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :examinations, dependent: :destroy
end
