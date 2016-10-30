class PostsController < ApplicationController

	layout "admin"
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  	 @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created successfully."
       redirect_to(:action => 'show', :id => @post.id)
    else
      render('new')
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully."
       redirect_to(:action => 'show', :id => @post.id)
    else
      render('edit')
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
    if params[:post_id]
      @post = Post.find(params[:post_id])
     end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
