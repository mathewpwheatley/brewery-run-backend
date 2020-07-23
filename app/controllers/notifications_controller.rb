class NotificationsController < ApplicationController
  # authorized is running before all methods since it is in ApplicationController

  def update
    notification = Notification.find(params[:id])
    notification.update(notification_params)
    if notification.valid?
      render json: notification, serializer: NotificationSerializer, status: :accepted
    else
      render json: {errors: notification.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    render json: {messages: ['Notification has been delete']}, status: :ok
  end

  private
  # Only allow a list of trusted parameters through.
  def notification_params
    params.require(:notification).permit(:title, :content, :link, :read, :user_id)
  end

end
