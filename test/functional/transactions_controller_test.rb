require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  test "should get notify" do
    get :notify
    assert_response :success
  end

  test "should get done" do
    get :done
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
