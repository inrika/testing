class OnlineTestsController < ApplicationController
  before_action :current_cart, only: [:show]
  def index
    @online_tests= OnlineTest.all
  end

  def show
    @online_test = OnlineTest.find(params[:id])
    @questions = @online_test.questions
    #начинаем проходить новый тест, в корзине не должно быть информации по старым тестам
    @cart.clear_cart if @cart.online_test # (это если пользователь не закончив тест, решил пройти другой)
    @cart.online_test = @online_test
    @cart.save

    #создаю очередь из вопросов в случайном порядке
    @queue = @questions.shuffle.to_a
    redirect_to online_test_question_path(id: @queue.first.id, online_test_id: @online_test.id, queue: @queue)
  end

end
