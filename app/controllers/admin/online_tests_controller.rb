class Admin::OnlineTestsController < ApplicationController
  before_action :set_online_test, only: [:show, :edit, :update, :destroy]

  # GET /online_tests
  # GET /online_tests.json
  def index
    @online_tests = OnlineTest.all
  end

  # GET /online_tests/1
  # GET /online_tests/1.json
  def show
  end

  # GET /online_tests/new
  def new
    @online_test = OnlineTest.new
  end

  # GET /online_tests/1/edit
  def edit
  end

  # POST /online_tests
  # POST /online_tests.json
  def create
    @online_test = OnlineTest.new(online_test_params)

    respond_to do |format|
      if @online_test.save
        format.html { redirect_to [:admin,@online_test], notice: 'Online test was successfully created.' }
        format.json { render :show, status: :created, location: @online_test }
      else
        format.html { render :new }
        format.json { render json: @online_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /online_tests/1
  # PATCH/PUT /online_tests/1.json
  def update
    respond_to do |format|
      if @online_test.update(online_test_params)
        format.html { redirect_to [:admin,@online_test], notice: 'Online test was successfully updated.' }
        format.json { render :show, status: :ok, location: @online_test }
      else
        format.html { render :edit }
        format.json { render json: @online_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /online_tests/1
  # DELETE /online_tests/1.json
  def destroy
    @online_test.destroy
    respond_to do |format|
      format.html { redirect_to admin_online_tests_url, notice: 'Online test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_online_test
    @online_test = OnlineTest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def online_test_params
    params.require(:online_test).permit(:title)
  end
end
