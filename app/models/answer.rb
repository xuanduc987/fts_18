class Answer < ActiveRecord::Base
  belongs_to :examination
  belongs_to :option
  belongs_to :question

  delegate :options, :question_type, to: :question
end
