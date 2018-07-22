require 'test_helper'

class DummyranksControllerTest < ActionController::TestCase
  setup do
    @dummyrank = dummyranks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dummyranks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dummyrank" do
    assert_difference('Dummyrank.count') do
      post :create, dummyrank: { content: @dummyrank.content, rankname: @dummyrank.rankname }
    end

    assert_redirected_to dummyrank_path(assigns(:dummyrank))
  end

  test "should show dummyrank" do
    get :show, id: @dummyrank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dummyrank
    assert_response :success
  end

  test "should update dummyrank" do
    patch :update, id: @dummyrank, dummyrank: { content: @dummyrank.content, rankname: @dummyrank.rankname }
    assert_redirected_to dummyrank_path(assigns(:dummyrank))
  end

  test "should destroy dummyrank" do
    assert_difference('Dummyrank.count', -1) do
      delete :destroy, id: @dummyrank
    end

    assert_redirected_to dummyranks_path
  end
end
