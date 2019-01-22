class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  ActsAsTaggableOn.force_lowercase = true
end
