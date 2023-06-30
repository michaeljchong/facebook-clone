class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all
    @friends = current_user.friends
    @sent_requests = current_user.sent_requests
    @received_requests = current_user.received_requests
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end
end
