class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:title]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :force_json, only: :autocomplete

  def title
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @post = Post.new

    @items = Post.where(["title LIKE ?","%#{params[:search]}%"])
 
  end

  # GET /posts/1
  # GET /posts/1.json
  # D-day 보여주는 액션
  def show
    @exp_date = @post.exp_date
    @today = Date.today
    @remain = (@exp_date - @today).to_i
    @sign = '-'
    if @remain <= 0
      @result = "사용기한 끝! 쓰지마세요!"
      @remain = -@remain
      @sign = '+'
    elsif @remain <= 10
      @result = "10일 이내"
    elsif @remain <= 20
      @result = "10일~20일"
    elsif @remain <= 30
      @result = "20일~30일"
    elsif @remain <= 40
      @result = "30일~40일"
    elsif @remain <= 50
      @result = "40일~50일"     
    else
      @result = "안전함(50일 이상)"
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def search
      @items = Post.where(["title LIKE ?","%#{params[:search]}%"])
      @post = Post.new
    end 

    def autocomplete
      @items = Post.where(["title LIKE ?","%#{params[:search]}%"]).limit(5)

    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :memo, :img_url, :category, :open_date, :exp_date, :public, :user_id, :carrierimage)
    end

    def force_json
      request.format = :json
    end


end
