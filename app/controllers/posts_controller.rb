class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
  access all: [:show, :index], user: {except: [:approve]}, site_admin: :all

  def index
    @search = Post.search(params[:q])
    @posts = @search.result.approved.recent
  end

  def my_posts
    forbidden! if current_user.role == 'guest'

    @posts = Post.posts_by(current_user).recent
  end

  def new
    forbidden! if current_user.role == 'guest'

    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Your post was created successfully."
      AdminMailer.email.deliver_now
    else
      render :new
    end
  end

  def show
    set_post
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    redirect_to posts_path, notice: 'Your post has been deleted.'
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'This post has been approved.'
  end

  private
    def post_params
      params.require(:post).permit(:title, :available, :price, :address, :status, :purpose, :water_type, :division_id, :region_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end