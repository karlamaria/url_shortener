class Api::V1::LinksController < ApplicationController
  # GET /links/abc
  def expand
    @link = Link.find(params[:short_url])
    if @link
      @link.increment!(:clicks)
      redirect_to @link.long_url, status: :moved_permanently
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
    # Only allow a trusted parameter "white list" through.
    def link_params
      params.require(:link).permit(:long_url)
    end
end
