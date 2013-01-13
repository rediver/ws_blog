# before_filter :signed_in_user, only: [:edit, :update]  
# before_filter :correct_user, only: [:edit, :update] 


class BlogsController < ApplicationController
respond_to :html,:xml,:json 

  def index
    @blogs = Blog.all
    respond_with(@blogs) 
  end

  def show
    @blog = Blog.find(params[:id])
    respond_with(@blog) 
  end

  def new
    @blog = Blog.new
    respond_with(@blog) 
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])
    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end 
end

