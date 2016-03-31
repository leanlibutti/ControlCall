require 'test_helper'

class ProovedorsControllerTest < ActionController::TestCase
  setup do
    @proovedor = proovedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proovedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proovedor" do
    assert_difference('Proovedor.count') do
      post :create, proovedor: { lines: @proovedor.lines, name: @proovedor.name }
    end

    assert_redirected_to proovedor_path(assigns(:proovedor))
  end

  test "should show proovedor" do
    get :show, id: @proovedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proovedor
    assert_response :success
  end

  test "should update proovedor" do
    patch :update, id: @proovedor, proovedor: { lines: @proovedor.lines, name: @proovedor.name }
    assert_redirected_to proovedor_path(assigns(:proovedor))
  end

  test "should destroy proovedor" do
    assert_difference('Proovedor.count', -1) do
      delete :destroy, id: @proovedor
    end

    assert_redirected_to proovedors_path
  end
end
