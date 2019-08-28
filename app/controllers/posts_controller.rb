class PostsController < ApplicationController
  before_action :load_post, only: [:edit, :update]
  def index
    @posts = Post.all
  end

  # def show
  #   @posts = current_user.posts.order(created_at: :desc)
  # end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    redirect_to current_user
  end

  def update
    flash[:notice] = "Post updated successfully" if @post.update(post_params)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def load_post
    @post = Post.find_by!(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end
