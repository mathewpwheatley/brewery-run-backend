class FollowsController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    follow = Follow.create(follow_params)
    if follow.valid?
      new_follow_notification(follow)
      render json: follow, serializer: FollowSerializer, status: :accepted
    else
      render json: {errors: follow.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    render json: {messages: ['Follow has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def follow_params
    params.require(:follow).permit(:followee_id, :follower_id)
  end

  def new_follow_notification(follow)
    user_name = User.find(follow.follower_id).full_name
    title = "Well, isn't someone popular!"
    content = "#{user_name} just started following you."
    Notification.create(title: title, content: message, user_id: follow.followee.id)
  end

end
