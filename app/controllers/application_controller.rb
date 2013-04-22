class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include CoordinatorsessionsHelper
  include JudgesessionsHelper
  
  private
  
  def require_logged_in
    unless coordinator_signed_in? or judge_signed_in?
      
      redirect_to root_path
    end
  end
  
end
