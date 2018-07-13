require 'test_helper'

class PostsTagsControllerTest < ActionController::TestCase
  setup do
    @posts_tag = posts_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_tag" do
    assert_difference('PostsTag.count') do
      post :create, posts_tag: { post_id: @posts_tag.post_id, tag_id: @posts_tag.tag_id }
    end

    assert_redirected_to posts_tag_path(assigns(:posts_tag))
  end

  test "should show posts_tag" do
    get :show, id: @posts_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_tag
    assert_response :success
  end

  test "should update posts_tag" do
    patch :update, id: @posts_tag, posts_tag: { post_id: @posts_tag.post_id, tag_id: @posts_tag.tag_id }
    assert_redirected_to posts_tag_path(assigns(:posts_tag))
  end

  test "should destroy posts_tag" do
    assert_difference('PostsTag.count', -1) do
      delete :destroy, id: @posts_tag
    end

    assert_redirected_to posts_tags_path
  end
end
