class ApplicationController < ActionController::API
  def index
    render json: { status: 'Ok' }
  end
end
