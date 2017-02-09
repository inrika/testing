class QuestionsController < ApplicationController
  before_action :current_cart
  def show
    @online_test = OnlineTest.find(params[:online_test_id])
    @queue = params[:queue]
    if @queue
      @question = @online_test.questions.find(@queue.first)
      @answers = @question.answers #.shuffle # - если ничего не выбрано, то будет меняться порядок
    else # очередь пуста
      redirect_to statistics_online_test_questions_path
    end
  end

  def statistics
    @online_test = OnlineTest.find(params[:online_test_id])
    @correct = @cart.total_correct_questions
    @total = @cart.total_questions
    @wrong = @total - @correct
    @percent = (100*@correct)/@total
    #почистить корзину
    @cart.destroy
  end

end
