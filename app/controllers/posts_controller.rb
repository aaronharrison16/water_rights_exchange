class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
  access all: [:show, :index], user: {except: [:approve, :sold, :sold_posts]}, site_admin: :all

  def index
    @posts = Post.approved.sale_pending.recent
  end

  def my_posts
    forbidden! if current_user.role == 'guest'

    @posts = Post.posts_by(current_user).recent
  end

  def sold_posts
    @posts = Post.sold.recent_update
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
      AdminMailer.email.deliver
    else
      render :new
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Your listing was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Your listing has been deleted.'
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'This listing has been approved.'
  end

  def sold
    set_post.sold!
    set_post.update(sale_date: Date.today) 
    redirect_to posts_path, notice: 'This listing has been marked as sold!'
  end

  private
    def post_params
      params.require(:post).permit(:title, :available, :price, :address, :status, :purpose, :water_type, :division_id, :region_id, :right_number, :sale_date, :irrigation_company)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end