class MembersController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    @member = Member.new(member_params)
    @member.status = 'active'
    if @member.save
      render :json => @member, :status => :created
    else
      render :json => @member.errors, :status => :bad_request
    end
  end

  private
    def member_params
      params.require(:member).permit(:user_id, :group_id)
    end
end
