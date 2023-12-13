class AuthorizedController < ApplicationController
  before_action :set_current_tenant
  before_action :authorize_member



  private
  def authorize_member
    redirect_to root_path, alert: "You are not a member of this tenant" unless @current_tenant.users.include?(current_user)
  end
  def set_current_tenant
    @current_tenant = Tenant.find(params[:tenant_id])
  end

end
