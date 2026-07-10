require "test_helper"

class SubBreedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_breed = sub_breeds(:one)
  end

  test "should get show" do
    get sub_breed_url(@sub_breed)

    assert_response :success
  end
end