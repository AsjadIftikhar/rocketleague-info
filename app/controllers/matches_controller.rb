class MatchesController < InheritedResources::Base

  private

    def match_params
      params.require(:match).permit(:date, :tournament_id)
    end

end
