class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :set_time_zone

private

  def set_time_zone(&block)
    Time.use_zone('Jakarta', &block)
  end
end
