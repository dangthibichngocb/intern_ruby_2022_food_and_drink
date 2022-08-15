class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  layout proc{false if request.xhr?}
end
