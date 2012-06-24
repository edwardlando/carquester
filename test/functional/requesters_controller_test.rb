require 'test_helper'

class RequestersControllerTest < ActionController::TestCase
  setup do
    @requester = requesters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requester" do
    assert_difference('Requester.count') do
      post :create, requester: { user_id: @requester.user_id }
    end

    assert_redirected_to requester_path(assigns(:requester))
  end

  test "should show requester" do
    get :show, id: @requester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requester
    assert_response :success
  end

  test "should update requester" do
    put :update, id: @requester, requester: { user_id: @requester.user_id }
    assert_redirected_to requester_path(assigns(:requester))
  end

  test "should destroy requester" do
    assert_difference('Requester.count', -1) do
      delete :destroy, id: @requester
    end

    assert_redirected_to requesters_path
  end
end
