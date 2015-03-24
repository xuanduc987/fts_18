class Question < ActiveRecord::Base
  QUESTION_TYPES = %w(multiple_choice text)

  belongs_to :course
  has_many :options, dependent: :destroy

  validates :question_type, presence: true,  inclusion: {in: QUESTION_TYPES}

  QUESTION_TYPES.each do |type|
    define_method "#{type}?" do
      self.question_type == type
    end
  end
end
