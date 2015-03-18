class Result < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :answers, dependent: :destroy
end
