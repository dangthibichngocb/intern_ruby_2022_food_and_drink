class ApplicationController < ActionController::Base
  include Pagy::Frontend
  protect_from_forgery with: :exception
  layout proc { false if request.xhr? }
end
