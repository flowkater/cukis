require 'test_helper'

class SchoolinfosControllerTest < ActionController::TestCase
  setup do
    @schoolinfo = schoolinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schoolinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schoolinfo" do
    assert_difference('Schoolinfo.count') do
      post :create, schoolinfo: @schoolinfo.attributes
    end

    assert_redirected_to schoolinfo_path(assigns(:schoolinfo))
  end

  test "should show schoolinfo" do
    get :show, id: @schoolinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schoolinfo
    assert_response :success
  end

  test "should update schoolinfo" do
    put :update, id: @schoolinfo, schoolinfo: @schoolinfo.attributes
    assert_redirected_to schoolinfo_path(assigns(:schoolinfo))
  end

  test "should destroy schoolinfo" do
    assert_difference('Schoolinfo.count', -1) do
      delete :destroy, id: @schoolinfo
    end

    assert_redirected_to schoolinfos_path
  end
end
