class DogImagesController < ApplicationController
  def show
    @dog_image = DogImage.includes(:breed).find(params[:id])
    @breed = @dog_image.breed
  end
end
