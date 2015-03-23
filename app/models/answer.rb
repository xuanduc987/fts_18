class Answer < ActiveRecord::Base
  belongs_to :result
  belongs_to :option
  belongs_to :question

  delegate :options, to: :question
end
