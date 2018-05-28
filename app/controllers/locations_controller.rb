class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :reply_new]

  def index
    # self.paginate
  end

  def paginate
    # @posts = Post.where(:parent_id => nil).paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    sentence = params[:msg].downcase

    if !params[:msg].blank?
      bad_words.each do |word|
        sentence.gsub!(/#{word}/,'#removido#')
      end
    end
    params[:msg] = sentence

    @post = Post.new(:msg => params[:msg])

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post criado com sucesso.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Post.where(:main_parent_id => @post.id).delete_all
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Item deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @post = Location.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:msg)
    end
end
