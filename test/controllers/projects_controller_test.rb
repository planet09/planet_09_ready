require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { account: @project.account, body: @project.body, comment_id: @project.comment_id, description: @project.description, end_date: @project.end_date, goal: @project.goal, option: @project.option, p_id: @project.p_id, p_name: @project.p_name, price: @project.price, rel_project1_url: @project.rel_project1_url, rel_project2_url: @project.rel_project2_url, start_date: @project.start_date, user_id: @project.user_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { account: @project.account, body: @project.body, comment_id: @project.comment_id, description: @project.description, end_date: @project.end_date, goal: @project.goal, option: @project.option, p_id: @project.p_id, p_name: @project.p_name, price: @project.price, rel_project1_url: @project.rel_project1_url, rel_project2_url: @project.rel_project2_url, start_date: @project.start_date, user_id: @project.user_id }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
