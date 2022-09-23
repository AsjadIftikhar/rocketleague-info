require "test_helper"

class UserFollowMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_follow_match = user_follow_matches(:one)
  end

  test "should get index" do
    get user_follow_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_user_follow_match_url
    assert_response :success
  end

  test "should create user_follow_match" do
    assert_difference("UserFollowMatch.count") do
      post user_follow_matches_url, params: { user_follow_match: { time_before_notification: @user_follow_match.time_before_notification } }
    end

    assert_redirected_to user_follow_match_url(UserFollowMatch.last)
  end

  test "should show user_follow_match" do
    get user_follow_match_url(@user_follow_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_follow_match_url(@user_follow_match)
    assert_response :success
  end

  test "should update user_follow_match" do
    patch user_follow_match_url(@user_follow_match), params: { user_follow_match: { time_before_notification: @user_follow_match.time_before_notification } }
    assert_redirected_to user_follow_match_url(@user_follow_match)
  end

  test "should destroy user_follow_match" do
    assert_difference("UserFollowMatch.count", -1) do
      delete user_follow_match_url(@user_follow_match)
    end

    assert_redirected_to user_follow_matches_url
  end
end
