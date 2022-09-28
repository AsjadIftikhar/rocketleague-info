require "test_helper"

class ScoreRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score_record = score_records(:one)
  end

  test "should get index" do
    get score_records_url
    assert_response :success
  end

  test "should get new" do
    get new_score_record_url
    assert_response :success
  end

  test "should create score_record" do
    assert_difference("ScoreRecord.count") do
      post score_records_url, params: { score_record: { goals: @score_record.goals, match_id: @score_record.match_id, player_id: @score_record.player_id, team_id: @score_record.team_id } }
    end

    assert_redirected_to score_record_url(ScoreRecord.last)
  end

  test "should show score_record" do
    get score_record_url(@score_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_score_record_url(@score_record)
    assert_response :success
  end

  test "should update score_record" do
    patch score_record_url(@score_record), params: { score_record: { goals: @score_record.goals, match_id: @score_record.match_id, player_id: @score_record.player_id, team_id: @score_record.team_id } }
    assert_redirected_to score_record_url(@score_record)
  end

  test "should destroy score_record" do
    assert_difference("ScoreRecord.count", -1) do
      delete score_record_url(@score_record)
    end

    assert_redirected_to score_records_url
  end
end
