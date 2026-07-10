class BreedsController < ApplicationController
  def index
    @breeds = Breed.order(:name)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end