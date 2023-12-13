class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def landing_page

  end

  def dashboard

  end
end
