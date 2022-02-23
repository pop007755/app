class MessagesController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    if validate_user_for_group
      @message = Message.new(message_params)
      @message.delivered_at = DateTime.now
      if @message.save
        render :json => @message, :status => :created
      else
        render :json => @message.errors, :status => :bad_request
      end
    else
      render :json => "Invalid request", :status => :bad_request
    end
    
  end

  def index
    if validate_user_for_group
      @group = Group.find(params[:group_id])
      @messages = @group.messages.order(delivered_at: :desc)
      render :json => @messages, :status => :ok
    else
      render :json => "Invalid request", :status => :bad_request
    end
  end

  private
    def message_params
      params.require(:message).permit(:user_name, :group_id, :body)
    end

    def validate_user_for_group
      return false unless params[:user_id].present? && params[:group_id].present?
      @member = Member.find_by(user_id: params[:user_id], group_id: params[:group_id])
      return @member.present?
    end
end
