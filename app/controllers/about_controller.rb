class AboutController < ApplicationController
  skip_before_action :authenticate_request, only: :show
  before_action :set_about, only: [:show, :update, :destroy]

  # GET /about
  def show
    render json: @about.as_json(only: %i[title content])
  end

  # PATCH/PUT /about
  def update
    if @about.update(about_params)
      render json: @about.as_json(only: %i[title content])
    else
      render json: @about.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.last
    end

    # Only allow a trusted parameter "white list" through.
    def about_params
      params.require(:about).permit(:title, :content)
    end
end
