class AddNotificationIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :notification_id, :integer
  end
end
