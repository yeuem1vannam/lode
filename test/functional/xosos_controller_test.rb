require 'test_helper'

class XososControllerTest < ActionController::TestCase
  setup do
    @xoso = xosos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xosos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xoso" do
    assert_difference('Xoso.count') do
      post :create, xoso: { diem: @xoso.diem, so: @xoso.so, type: @xoso.type }
    end

    assert_redirected_to xoso_path(assigns(:xoso))
  end

  test "should show xoso" do
    get :show, id: @xoso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xoso
    assert_response :success
  end

  test "should update xoso" do
    put :update, id: @xoso, xoso: { diem: @xoso.diem, so: @xoso.so, type: @xoso.type }
    assert_redirected_to xoso_path(assigns(:xoso))
  end

  test "should destroy xoso" do
    assert_difference('Xoso.count', -1) do
      delete :destroy, id: @xoso
    end

    assert_redirected_to xosos_path
  end
end
