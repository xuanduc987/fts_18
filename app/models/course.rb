class Course < ActiveRecord::Base
  has_many :question, dependent: :destroy
  has_many :results, dependent: :destroy
end
