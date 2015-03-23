class Examination < ActiveRecord::Base
  TIME_LIMIT = 20

  belongs_to :course
  belongs_to :user
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  delegate :name, to: :course, prefix: true

  def time_up?
    created_at < TIME_LIMIT.minutes.ago
  end
end
