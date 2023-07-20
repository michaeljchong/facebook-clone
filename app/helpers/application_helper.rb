module ApplicationHelper
  def new_notification(user_id, notification_id, category)
    User.find(user_id).notifications.create(notification_id: notification_id, category: category)
  end

  def formatted_time(item)
    item.created_at.strftime("%b %-d, %Y at %-I:%M %p")
  end
end
