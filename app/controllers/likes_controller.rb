class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post_id = params[:post_id]
    @like = Like.create(user_id: current_user.id,
                post_id: @post_id)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js {} #create.js.erb출력하겠다는 약속
    end
  end

  def destroy
    @post_id = params[:post_id]
    @like = Like.find_by(user_id: current_user.id,
                post_id: @post_id)
    @like.destroy

    respond_to do |format|
      format.html {redirect_to :back}
      format.js {}
    end
  end
end
