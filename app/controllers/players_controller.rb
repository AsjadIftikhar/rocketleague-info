class PlayersController < InheritedResources::Base

  private

    def player_params
      params.require(:player).permit(:name, :age, :country, :team_id)
    end

end
