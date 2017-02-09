require 'spec_helper'

describe OnlineTestsController do
  describe "show action" do
    it 'cart and user_replies must be empty'do
      online_test=FactoryGirl.create(:online_test_with_questions)

      get :show, params:{id: online_test.id}


    end
  end
end