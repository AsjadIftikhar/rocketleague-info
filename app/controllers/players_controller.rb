class PlayersController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    query = params[:q]
    if not query.empty?
      @players = Player.where("name = ? or country = ?", query, query)
    else
      @players = Player.all
    end
  end

  private

    def player_params
      params.require(:player).permit(:name, :age, :country, :team_id)
    end

end
