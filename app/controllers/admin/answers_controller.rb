class Admin::AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  def create
    @online_test = OnlineTest.find(params[:online_test_id])
    @question = @online_test.questions.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to [:admin,   @question.online_test, @question]
  end

  def show

  end
  def edit

  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to [:admin,@online_test, @question], notice: 'answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @online_test }
      else
        format.html { render :edit }
        format.json { render json: @online_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to [:admin,@question.online_test, @question], notice: 'answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_answer
    @online_test = OnlineTest.find(params[:online_test_id])
    @question = @online_test.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text, :is_correct)
  end
end
