class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friend_requester.new(requestee_id: params[:user_id], accepted: true)

     if @friendship.save
      flash[:success] = 'Friend Request Sent!'
    else
      flash[:danger] = 'Friend Request Failed!'
    end

    redirect_to root_path
  end
end
