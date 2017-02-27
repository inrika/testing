class Admin::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  def show

  end
  def create
    @online_test = OnlineTest.find(params[:online_test_id])
    @question = @online_test.questions.create(question_params)
    redirect_to [:admin,@online_test]
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to [:admin,@online_test], notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_question

    @online_test = OnlineTest.find(params[:online_test_id])
    @question = @online_test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title)
  end
end
