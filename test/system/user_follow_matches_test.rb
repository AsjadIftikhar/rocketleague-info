require "application_system_test_case"

class UserFollowMatchesTest < ApplicationSystemTestCase
  setup do
    @user_follow_match = user_follow_matches(:one)
  end

  test "visiting the index" do
    visit user_follow_matches_url
    assert_selector "h1", text: "User follow matches"
  end

  test "should create user follow match" do
    visit user_follow_matches_url
    click_on "New user follow match"

    fill_in "Hours before notification", with: @user_follow_match.hours_before_notification
    click_on "Create User follow match"

    assert_text "User follow match was successfully created"
    click_on "Back"
  end

  test "should update User follow match" do
    visit user_follow_match_url(@user_follow_match)
    click_on "Edit this user follow match", match: :first

    fill_in "Hours before notification", with: @user_follow_match.hours_before_notification
    click_on "Update User follow match"

    assert_text "User follow match was successfully updated"
    click_on "Back"
  end

  test "should destroy User follow match" do
    visit user_follow_match_url(@user_follow_match)
    click_on "Destroy this user follow match", match: :first

    assert_text "User follow match was successfully destroyed"
  end
end
