require "application_system_test_case"

class ScoreRecordsTest < ApplicationSystemTestCase
  setup do
    @score_record = score_records(:one)
  end

  test "visiting the index" do
    visit score_records_url
    assert_selector "h1", text: "Score records"
  end

  test "should create score record" do
    visit score_records_url
    click_on "New score record"

    fill_in "Goals", with: @score_record.goals
    fill_in "Match", with: @score_record.match_id
    fill_in "Player", with: @score_record.player_id
    fill_in "Team", with: @score_record.team_id
    click_on "Create Score record"

    assert_text "Score record was successfully created"
    click_on "Back"
  end

  test "should update Score record" do
    visit score_record_url(@score_record)
    click_on "Edit this score record", match: :first

    fill_in "Goals", with: @score_record.goals
    fill_in "Match", with: @score_record.match_id
    fill_in "Player", with: @score_record.player_id
    fill_in "Team", with: @score_record.team_id
    click_on "Update Score record"

    assert_text "Score record was successfully updated"
    click_on "Back"
  end

  test "should destroy Score record" do
    visit score_record_url(@score_record)
    click_on "Destroy this score record", match: :first

    assert_text "Score record was successfully destroyed"
  end
end
