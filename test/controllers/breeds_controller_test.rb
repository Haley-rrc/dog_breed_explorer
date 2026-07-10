require "test_helper"

class BreedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breed = breeds(:one)
  end

  test "should get index" do
    get breeds_url

    assert_response :success
  end

  test "should get show" do
    get breed_url(@breed)

    assert_response :success
  end
end