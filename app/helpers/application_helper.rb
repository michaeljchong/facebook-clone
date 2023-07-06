module ApplicationHelper
  def new_notification(user_id, notification_id, category)
    User.find(user_id).notifications.create(notification_id: notification_id, category: category)
  end
end
