class ChangeDefaultProfileImageFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :profile_img, from: nil, to: "default-profile-icon-24.jpg"
  end
end
