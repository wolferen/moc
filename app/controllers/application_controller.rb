class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'weather-api'
  require 'open-uri'
end
