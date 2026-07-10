class BreedsController < ApplicationController
  def index
    @breeds = Breed.order(:name)

    if params[:query].present?
      @breeds = @breeds.where(
        "LOWER(name) LIKE ?",
        "%#{params[:query].downcase}%"
      )
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end
end