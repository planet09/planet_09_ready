class PostsTagsController < ApplicationController
  before_action :set_posts_tag, only: [:show, :edit, :update, :destroy]

  # GET /posts_tags
  # GET /posts_tags.json
  def index
    @posts_tags = PostsTag.all
  end

  # GET /posts_tags/1
  # GET /posts_tags/1.json
  def show
  end

  # GET /posts_tags/new
  def new
    @posts_tag = PostsTag.new
  end

  # GET /posts_tags/1/edit
  def edit
  end

  # POST /posts_tags
  # POST /posts_tags.json
  def create
    @posts_tag = PostsTag.new(posts_tag_params)

    respond_to do |format|
      if @posts_tag.save
        format.html { redirect_to @posts_tag, notice: 'Posts tag was successfully created.' }
        format.json { render :show, status: :created, location: @posts_tag }
      else
        format.html { render :new }
        format.json { render json: @posts_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts_tags/1
  # PATCH/PUT /posts_tags/1.json
  def update
    respond_to do |format|
      if @posts_tag.update(posts_tag_params)
        format.html { redirect_to @posts_tag, notice: 'Posts tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @posts_tag }
      else
        format.html { render :edit }
        format.json { render json: @posts_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts_tags/1
  # DELETE /posts_tags/1.json
  def destroy
    @posts_tag.destroy
    respond_to do |format|
      format.html { redirect_to posts_tags_url, notice: 'Posts tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posts_tag
      @posts_tag = PostsTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posts_tag_params
      params.require(:posts_tag).permit(:post_id, :tag_id)
    end
end
