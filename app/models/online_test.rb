class OnlineTest < ApplicationRecord
  validates :title, presence: true
  has_many :questions
#  has_many :user_replies
  has_many :carts

  def correct_answers
    answers = {}
    questions.each do |question|
      question.answers.each do |answer|
        if answers[question.id]
          answers[question.id]<<answer.id if answer.is_correct
        else
         answers[question.id] = (Set.new)<<answer.id if answer.is_correct
        end
      end
    end
    answers
  end

  def total_questions
    questions.count
  end
end
