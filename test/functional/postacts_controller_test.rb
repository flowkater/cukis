require 'test_helper'

class PostactsControllerTest < ActionController::TestCase
  setup do
    @postact = postacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postact" do
    assert_difference('Postact.count') do
      post :create, postact: @postact.attributes
    end

    assert_redirected_to postact_path(assigns(:postact))
  end

  test "should show postact" do
    get :show, id: @postact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postact
    assert_response :success
  end

  test "should update postact" do
    put :update, id: @postact, postact: @postact.attributes
    assert_redirected_to postact_path(assigns(:postact))
  end

  test "should destroy postact" do
    assert_difference('Postact.count', -1) do
      delete :destroy, id: @postact
    end

    assert_redirected_to postacts_path
  end
end
