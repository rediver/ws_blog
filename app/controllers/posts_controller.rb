# before_filter :authenticate_user!,:authorize_user!
class PostsController < ApplicationController

before_filter :authenticate_admin!, only: [:edit, :update, :new, :create, :destroy]

respond_to :html,:xml,:json 
  def index
    @posts = Post.all
    respond_with(@posts) 
  end

  def show
    @post = Post.find(params[:id])
    respond_with(@post) 
  end

  def new
    @post = Post.new
    respond_with(@post) 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url, :notice => "Successfully destroyed post."
  end 

  def feed
    @posts = Post.all(:order => "created_at DESC", :limit => 20)
    respond_to do |format|
      format.rss
    end
  end

private

  def authorize_user!
    redirect_to root_path, :notice => 'Access denied!' unless current_user.admin?
  end

end

