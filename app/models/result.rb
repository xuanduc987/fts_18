class Result < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :answer, dependent: :destroy
end
