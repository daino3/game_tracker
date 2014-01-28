class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def client
    client = ESPN::Client.new(api_key: ENV["ESPN_KEY"])
  end

  helper_method :client
end
