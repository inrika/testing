class Cart < ApplicationRecord
  has_many :user_replies, dependent: :destroy
  belongs_to :online_test, optional: true

  def add_reply(online_test_id, question_id, answer_id)
    current_item= user_replies.find_by(answer_id: answer_id)
    if current_item
      current_item
    else
      current_item = user_replies.build(online_test_id: online_test_id, answer_id: answer_id, question_id: question_id)
      current_item
    end
  end

    def clear_cart
      if user_replies
        user_replies.each do |item|
          #item.cart_id = nil
          item.destroy
        end
      end

  end

  def total_questions
    online_test.questions.count
  end

  def total_correct_questions
    user_answers = {}
    user_replies.each do |user_reply|
      if user_answers[user_reply.answer.question.id]
        user_answers[user_reply.answer.question.id]<< user_reply.answer.id
      else
        user_answers[user_reply.answer.question.id]= (Set.new)<<(user_reply.answer.id)

      end
      #для eql? тоже важен порядок
    end
    correct_answers = online_test.correct_answers
    user_answers.inject(0) { |sum, (k, v)| v == correct_answers[k] ? sum+1 : sum }
  end

  def total_wrong_questions
    #user_replies.inject(0) { |sum, item|  item.answer.is_correct ? sum : sum+1}
  end

end
