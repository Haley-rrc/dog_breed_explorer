require "test_helper"

class DogImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog_image = dog_images(:one)
  end

  test "should get show" do
    get dog_image_url(@dog_image)

    assert_response :success
  end
end