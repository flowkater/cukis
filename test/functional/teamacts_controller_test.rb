require 'test_helper'

class TeamactsControllerTest < ActionController::TestCase
  setup do
    @teamact = teamacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teamacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teamact" do
    assert_difference('Teamact.count') do
      post :create, teamact: @teamact.attributes
    end

    assert_redirected_to teamact_path(assigns(:teamact))
  end

  test "should show teamact" do
    get :show, id: @teamact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teamact
    assert_response :success
  end

  test "should update teamact" do
    put :update, id: @teamact, teamact: @teamact.attributes
    assert_redirected_to teamact_path(assigns(:teamact))
  end

  test "should destroy teamact" do
    assert_difference('Teamact.count', -1) do
      delete :destroy, id: @teamact
    end

    assert_redirected_to teamacts_path
  end
end
