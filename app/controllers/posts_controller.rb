class PostsController < ApplicationController
  def index
    if current_user.present?
      @posts = Post.includes(:user).collection({ user_id: current_user })
    else
      @posts = Post.includes(:user).collection
    end
  end

  def new
    @post = Post.new(user_id: current_user)
  end

  def create
    @post = Post.create(params_posts)

    redirect_to posts_path
  end

  def edit
    @post = Post.find_by(id: params[:id], user_id: current_user)

    if @post.nil?
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(params_posts)

    redirect_to posts_path
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.delete

    redirect_to posts_path
  end

  private
    def params_posts
      params.require(:post).permit(:user_id, :title, :description)
    end
end
