require 'test_helper'

class FichaNacionalsControllerTest < ActionController::TestCase
  setup do
    @ficha_nacional = ficha_nacionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ficha_nacionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ficha_nacional" do
    assert_difference('FichaNacional.count') do
      post :create, ficha_nacional: { code: @ficha_nacional.code, constante_id: @ficha_nacional.constante_id, valor_min: @ficha_nacional.valor_min, valor_seg: @ficha_nacional.valor_seg }
    end

    assert_redirected_to ficha_nacional_path(assigns(:ficha_nacional))
  end

  test "should show ficha_nacional" do
    get :show, id: @ficha_nacional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ficha_nacional
    assert_response :success
  end

  test "should update ficha_nacional" do
    patch :update, id: @ficha_nacional, ficha_nacional: { code: @ficha_nacional.code, constante_id: @ficha_nacional.constante_id, valor_min: @ficha_nacional.valor_min, valor_seg: @ficha_nacional.valor_seg }
    assert_redirected_to ficha_nacional_path(assigns(:ficha_nacional))
  end

  test "should destroy ficha_nacional" do
    assert_difference('FichaNacional.count', -1) do
      delete :destroy, id: @ficha_nacional
    end

    assert_redirected_to ficha_nacionals_path
  end
end
