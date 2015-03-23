class Examination < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :answers, dependent: :destroy

  delegate :name, to: :course, prefix: true
end
