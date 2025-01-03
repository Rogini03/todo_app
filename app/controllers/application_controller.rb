class ApplicationController < ActionController::API
    before_action :authenticate_user! # Ensures Devise JWT authentication is applied
  
    private
  
 
    # def current_user
    #   # Devise method to return the currently authenticated user (via JWT token)
    #   current_user ||= User.find_by(id: decoded_token[:user_id]) if decoded_token
    # end
  
    # def decoded_token
    #   # A helper method to decode the JWT from the Authorization header
    #   token = request.headers['Authorization'].to_s.split(' ').last
    #   JWT.decode(token, Rails.application.secret_key_base).first if token
    # rescue JWT::DecodeError
    #   nil
    # end
end
