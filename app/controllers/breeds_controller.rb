class BreedsController < ApplicationController
  def index
    @breeds = Breed.order(:name)

    if params[:query].present?
      @breeds = @breeds.where(
        "LOWER(name) LIKE ?",
        "%#{params[:query].downcase}%"
      )
    end

    case params[:category]
    when "with_sub_breeds"
      @breeds = @breeds.joins(:sub_breeds).distinct
    when "without_sub_breeds"
      @breeds = @breeds.left_joins(:sub_breeds)
                         .where(sub_breeds: { id: nil })
    when "featured"
      @breeds = @breeds.where(featured: true)
    end

    @breeds = @breeds.page(params[:page]).per(12)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end