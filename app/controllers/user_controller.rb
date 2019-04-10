class UserController < ApplicationController
  before_action :authenticate_user!

  def update_other
    @other = User.find(params[:id])
    if !params[:user].blank?
      @other.update_attributes(params.require(:user).permit(:membership))
    end
    redirect_to '/user/profile'
  end

  def booking
    @coaches = User.coaches
    render "booking"
  end

  def member_profile
    # For testing purposes below
    # if !(:current_user.blank?)
    #   @membership = :current_user.membership
    # end
    
    # For testing purposes above
    @name = current_user.name
    @membership = current_user.membership
    if current_user.membership == 'Club Member'
      render "club_member_profile"
      # Add everything else needed here
    elsif current_user.membership == 'Administrator'
      @users = User.all_users_except_admin
      render "administrator_profile"
      # Add everything else needed here
    elsif current_user.membership == 'Coach'
      render "coach_profile"
      # Add everything else needed here
    elsif current_user.membership == 'Manager'
      @users = User.manager_users_view
      render "manager_profile"
      # Add everything else needed here
    end

  end

end
