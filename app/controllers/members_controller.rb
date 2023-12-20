class MembersController < AuthorizedController
  def index
    @members = @current_tenant.members
  end



  def invite
    email= params[:email]
    return redirect_to tenant_members_path(@current_tenant), alert: "Please enter an email address" if email.blank?

    user= User.find_by(email: email) || User.invite!({email:}, current_user)
    return redirect_to tenant_members_path(@current_tenant), notice: "User #{email} is not valid" unless user.valid?

    user.members.find_or_create_by(tenant: @current_tenant,roles: {admin: false, editor: true})
    #TODO: send email to user
    redirect_to tenant_members_path(@current_tenant), notice: "User #{email} was invited to join the team."
  end
end
