require 'test_helper'

class OnlineTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @online_test = online_tests(:one)
  end

  test "should get index" do
    get online_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_online_test_url
    assert_response :success
  end

  test "should create online_test" do
    assert_difference('OnlineTest.count') do
      post online_tests_url, params: { online_test: { title: @online_test.title } }
    end

    assert_redirected_to online_test_url(OnlineTest.last)
  end

  test "should show online_test" do
    get online_test_url(@online_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_online_test_url(@online_test)
    assert_response :success
  end

  test "should update online_test" do
    patch online_test_url(@online_test), params: { online_test: { title: @online_test.title } }
    assert_redirected_to online_test_url(@online_test)
  end

  test "should destroy online_test" do
    assert_difference('OnlineTest.count', -1) do
      delete online_test_url(@online_test)
    end

    assert_redirected_to online_tests_url
  end
end
