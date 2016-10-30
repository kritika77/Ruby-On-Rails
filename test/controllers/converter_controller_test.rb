require 'test_helper'

class ConverterControllerTest < ActionController::TestCase
  test "should get decimal" do
    get :decimal
    assert_response :success
  end

end
