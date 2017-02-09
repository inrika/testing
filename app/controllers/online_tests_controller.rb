class OnlineTestsController < ApplicationController
  before_action :current_cart, only: [:show]
  def index
    @online_tests= OnlineTest.all
  end

  def show
    @online_test = OnlineTest.find(params[:id])
    @questions = @online_test.questions
    #начинаем проходить новый тест, в корзине не должно быть информации по старым тестам
    # (это если пользователь не закончив тест, решил пройти другой)
    if @cart.online_test
      @cart.clear_cart
      @cart.online_test = @online_test
      @cart.save
    else
      @cart.online_test = @online_test
      @cart.save
    end

    #создаю очередь из вопросов в случайном порядке
    @queue = @questions.shuffle.to_a
    redirect_to online_test_question_path(id: @queue.first.id, online_test_id: @online_test.id, queue: @queue)
  end

end
