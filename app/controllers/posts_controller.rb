class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :order, :buy, :admin]
  before_action :authenticate_user!, except: [:index,:show]
  load_and_authorize_resource
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(12)
    else
      @posts = Post.order(created_at: :desc).page(params[:page]).per(12)
    end
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def mypage
    if params[:tag]
      @orderposts = current_user.orders
      @myposts = current_user.posts.tagged_with(params[:tag]).order(created_at: :desc).first(4)
      @likeposts = current_user.liked_posts.tagged_with(params[:tag]).order(created_at: :desc).first(4)
    else
      @orderposts = current_user.orders
      @myposts = current_user.posts.order(created_at: :desc).first(4)
      @likeposts = current_user.liked_posts.order(created_at: :desc).first(4)
    end
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def admin
    @orderlist=@post.orders
    puts @orderlist

    # @quantity #옵션 별 수량
    # @key=Order.find(@post.id==params[:id]).options.key
    # @valuse=Order.find(@post.id).options.value
    # @post = Post.find(params[:id])

  end


  def group
      if params[:tag]
        @posts = Post.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(12)
      else
        @posts = Post.order(created_at: :desc).page(params[:page]).per(12)
      end
      respond_to do |format|
        format.html
      end
   end

   #안드로이드 sms파싱코드
   def read
    @money = params[:money]
    @name= params[:name]

    logger.info "된다~~~"
  end



  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    puts "********************"
    @option_hash = Hash.new

    params[:post][:option].gsub(' ','').split('/').each do |option|
      @option_hash[option] = 0
    end

    keys = @option_hash.keys

    params[:post][:price].gsub(' ','').split('/').each_with_index do |price, index|
      @option_hash[keys[index]] = price
    end
    @post.option_price = @option_hash


    # @post.option_price =


    #@tags = params[:tags][:content].gsub(' ','').split("#")  #이미배열
    # @tags = ["#안녕, "#방탄소년단"]

    #Tag.create(content: @tags)
    #Tag.create(content: params[:tags][:content])

    respond_to do |format|
      if @post.save
        # @tags.each do |tag|
        #    # puts tag unless tag.empty?
        #    # Tag에 있는지 없는지 찾고
        #    unless tag.empty?
        #      @tag = Tag.find_or_create_by(content: tag)
        #      # PostsTag에 post id랑 tag id를 저장한다.
        #      PostsTag.create(post_id: @post.id ,tag_id: @tag.id)
        #   end
        # end

        # 저장이 되었을 경우에 실행
        # flash[:notice] = "글 작성이 완료되었습니다."
        # redirect_to '/'
        format.html { redirect_to '/', notice: '글 작성완료!' }
      else
        # 저장이 실패했을 경우에(validation) 걸렸을 때 실행
        # flash[:alert] = "글 작성이 실패했습니다."
        # redirect_to new_post_path
        format.html { render :new }
        format.json { render json: @post.errors }
      end
    end
  end

  def show
    @comments = @post.comments
    @option = [];
    if @post.option != nil
      @option = @post.option.gsub(' ','').split('/')
    else
      @option.push(@post.title)
    end

  end

  def edit
    # @hashtags = @post.to_hashtags
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post, notice: '글 수정완료!'}
      else
        format.html { render :edit }
        format.json { render json: @post.error }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to "/"
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :price, :option, :img , :account, :account_name, :goal, :start_date, :end_date, :description, :tag_list_fixed
                                  ) #넘어오는 파람 허가
    # params.require(:post).permit(:title, :content, :img , :start_date, :end_date, :description, tags_attributes: [:content]) #넘어오는 파람 허가
  end
end
