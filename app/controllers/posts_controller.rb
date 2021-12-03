class PostsController < ApplicationController
  def index
    if current_user.present?
      @posts = Post.includes(:user).collection({ user_id: current_user })
    else
      @posts = Post.includes(:user).collection
    end
  end

  def new
    redirect_to root_path if !current_user.present?

    @post = Post.new(user_id: current_user)
  end

  def create
    @post = Post.create(params_posts)

    flash[:message] = "A new posting has been added!"

    redirect_to root_path
  end

  def edit
    @post = Post.find_by(id: params[:id], user_id: current_user)

    if @post.nil?
      redirect_to root_path
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(params_posts)

    flash[:message] = "The posting has been updated!"

    redirect_to root_path
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @post.delete

    flash[:message] = "The posting has been deleted!"

    redirect_to root_path
  end

  private
    def params_posts
      params.require(:post).permit(:user_id, :title, :description, :is_public)
    end
end
