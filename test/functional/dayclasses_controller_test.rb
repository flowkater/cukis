require 'test_helper'

class DayclassesControllerTest < ActionController::TestCase
  setup do
    @dayclass = dayclasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dayclasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dayclass" do
    assert_difference('Dayclass.count') do
      post :create, dayclass: @dayclass.attributes
    end

    assert_redirected_to dayclass_path(assigns(:dayclass))
  end

  test "should show dayclass" do
    get :show, id: @dayclass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dayclass
    assert_response :success
  end

  test "should update dayclass" do
    put :update, id: @dayclass, dayclass: @dayclass.attributes
    assert_redirected_to dayclass_path(assigns(:dayclass))
  end

  test "should destroy dayclass" do
    assert_difference('Dayclass.count', -1) do
      delete :destroy, id: @dayclass
    end

    assert_redirected_to dayclasses_path
  end
end
