class PlayersController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @players = Player.custom_search(params[:q].present? ? params[:q] : "*").results

  end

  private

    def player_params
      params.require(:player).permit(:name, :age, :country, :team_id)
    end

end
