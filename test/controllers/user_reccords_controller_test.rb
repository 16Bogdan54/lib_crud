require "test_helper"

class UserReccordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_reccord = user_reccords(:one)
  end

  test "should get index" do
    get user_reccords_url
    assert_response :success
  end

  test "should get new" do
    get new_user_reccord_url
    assert_response :success
  end

  test "should create user_reccord" do
    assert_difference("UserReccord.count") do
      post user_reccords_url, params: { user_reccord: { library_id: @user_reccord.library_id, user_id: @user_reccord.user_id } }
    end

    assert_redirected_to user_reccord_url(UserReccord.last)
  end

  test "should show user_reccord" do
    get user_reccord_url(@user_reccord)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_reccord_url(@user_reccord)
    assert_response :success
  end

  test "should update user_reccord" do
    patch user_reccord_url(@user_reccord), params: { user_reccord: { library_id: @user_reccord.library_id, user_id: @user_reccord.user_id } }
    assert_redirected_to user_reccord_url(@user_reccord)
  end

  test "should destroy user_reccord" do
    assert_difference("UserReccord.count", -1) do
      delete user_reccord_url(@user_reccord)
    end

    assert_redirected_to user_reccords_url
  end
end
