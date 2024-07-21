class ApiController < ApplicationController
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |e|
    render json: { warning: e.message }, status: :forbidden
  end
end
