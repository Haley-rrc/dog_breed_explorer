class BreedsController < ApplicationController
  def index
    @sub_breeds = SubBreed.includes(:breed).order(:name)
    @breeds = Breed.order(:name)

    if params[:query].present?
      search_term = ActiveRecord::Base.sanitize_sql_like(
        params[:query].strip.downcase
      )

      @breeds = @breeds.where(
        "LOWER(breeds.name) LIKE ?",
        "%#{search_term}%"
      )
    end

    if params[:sub_breed_id].present?
      @breeds = @breeds
        .joins(:sub_breeds)
        .where(sub_breeds: { id: params[:sub_breed_id] })
        .distinct
    end

    if params[:featured] == "1"
      @breeds = @breeds.where(featured: true)
    end

    @breeds = @breeds.page(params[:page]).per(12)
  end

  def show
    @breed = Breed.includes(:sub_breeds, :dog_images).find(params[:id])
  end
end