require 'test_helper'

class RequesteesControllerTest < ActionController::TestCase
  setup do
    @requestee = requestees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requestees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requestee" do
    assert_difference('Requestee.count') do
      post :create, requestee: { user_id: @requestee.user_id }
    end

    assert_redirected_to requestee_path(assigns(:requestee))
  end

  test "should show requestee" do
    get :show, id: @requestee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requestee
    assert_response :success
  end

  test "should update requestee" do
    put :update, id: @requestee, requestee: { user_id: @requestee.user_id }
    assert_redirected_to requestee_path(assigns(:requestee))
  end

  test "should destroy requestee" do
    assert_difference('Requestee.count', -1) do
      delete :destroy, id: @requestee
    end

    assert_redirected_to requestees_path
  end
end
