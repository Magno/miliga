require 'test_helper'

class LigasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ligas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liga" do
    assert_difference('Liga.count') do
      post :create, :liga => { }
    end

    assert_redirected_to liga_path(assigns(:liga))
  end

  test "should show liga" do
    get :show, :id => ligas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ligas(:one).to_param
    assert_response :success
  end

  test "should update liga" do
    put :update, :id => ligas(:one).to_param, :liga => { }
    assert_redirected_to liga_path(assigns(:liga))
  end

  test "should destroy liga" do
    assert_difference('Liga.count', -1) do
      delete :destroy, :id => ligas(:one).to_param
    end

    assert_redirected_to ligas_path
  end
end
