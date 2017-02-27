class UserRepliesController < ApplicationController
  before_action :current_cart, only: [:create]

  def index
  end

  def create
    queue = params[:queue]
    question = Question.find(queue.first)
    online_test = question.online_test
    if @cart.user_replies.map(&:answer).map(&:question).include?(question)
      queue.slice!(0)
      redirect_to online_test_question_path(id: question.id, online_test_id: online_test.id, queue: queue), notice: "Вы уже  отвечали на вопрос #{question.title}, ответы останутся прежними"
    else
      if params[:answer_ids]
        params[:answer_ids].each do |answ|
          answer = Answer.find(answ)
          @user_reply = @cart.add_reply(answer.id)
          if @user_reply
            @user_reply.save
          else
            render "questions/error", notice: "2 раза на один и тот же вопрос" # вообще такого быть не должно - это для отладки
          end

        end
        queue.slice!(0)
        redirect_to online_test_question_path(id: question.id, online_test_id: online_test.id, queue: queue)

      else
        redirect_to online_test_question_path(id: question.id, online_test_id: online_test.id, queue: queue), notice: 'вы не выбрали ни один ответ'

      end

    end
  end
end
