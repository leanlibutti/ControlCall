require 'test_helper'

class FichansControllerTest < ActionController::TestCase
  setup do
    @fichan = fichans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fichan" do
    assert_difference('Fichan.count') do
      post :create, fichan: { code: @fichan.code, description: @fichan.description, valor_min_n: @fichan.valor_min_n, valor_min_r: @fichan.valor_min_r, valor_sec_n: @fichan.valor_sec_n, valor_sec_r: @fichan.valor_sec_r }
    end

    assert_redirected_to fichan_path(assigns(:fichan))
  end

  test "should show fichan" do
    get :show, id: @fichan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fichan
    assert_response :success
  end

  test "should update fichan" do
    patch :update, id: @fichan, fichan: { code: @fichan.code, description: @fichan.description, valor_min_n: @fichan.valor_min_n, valor_min_r: @fichan.valor_min_r, valor_sec_n: @fichan.valor_sec_n, valor_sec_r: @fichan.valor_sec_r }
    assert_redirected_to fichan_path(assigns(:fichan))
  end

  test "should destroy fichan" do
    assert_difference('Fichan.count', -1) do
      delete :destroy, id: @fichan
    end

    assert_redirected_to fichans_path
  end
end
