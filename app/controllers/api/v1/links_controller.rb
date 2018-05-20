class Api::V1::LinksController < ApplicationController
  # GET /metrics/a1b2c3
  def metrics
    @link = Link.find(params[:short_url])
    return not_found unless @link

    render json: { clicks: @link.clicks }, status: :ok
  end

  # GET /a1b2c3
  def expand
    @link = Link.find(params[:short_url])
    return not_found unless @link

    @link.increment!(:clicks)
    redirect_to @link.long_url, status: :moved_permanently
  end

  # POST /shorten
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

    def not_found
      head :not_found, "content_type" => 'text/plain'
    end
end
