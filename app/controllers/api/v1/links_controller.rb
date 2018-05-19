class Api::V1::LinksController < ApplicationController
  before_action :set_link, only: [:expand]

  # GET /links/abc
  def expand
    if @link
      redirect_to "//#{@link.longURL}", status: :moved_permanently
    else
      head :not_found, "content_type" => 'text/plain'
    end
  end

  # POST /links
  def shorten
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      link_id = params[:shortURL].to_i(36)
      @link = Link.find_by_id(link_id)
    end

    # Only allow a trusted parameter "white list" through.
    def link_params
      params.require(:link).permit(:longURL)
    end
end
