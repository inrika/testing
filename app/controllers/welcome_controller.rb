class WelcomeController < ApplicationController
  def index
    @online_tests = OnlineTest.all
  end
end
