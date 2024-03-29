class PostsController < ApplicationController
  before_action :set_post, :check_user, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = current_user.visible_posts.sort_by { |post| post.created_at }
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to posts_path
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated."
      redirect_to posts_path
    else
      render :edit
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    flash[:notice] = "Post was successfully destroyed." if @post.destroy
    redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def check_user
      unless current_user == @post.user
        flash[:alert] = "Post can only be modified by the post author"
        redirect_to posts_path
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
