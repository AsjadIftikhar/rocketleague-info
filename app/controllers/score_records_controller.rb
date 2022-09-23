class ScoreRecordsController < InheritedResources::Base

  private

    def score_record_params
      params.require(:score_record).permit(:goals, :player_id, :team_id, :match_id)
    end

end
