class PlayersController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource

  private

    def player_params
      params.require(:player).permit(:name, :age, :country, :team_id)
    end

end
