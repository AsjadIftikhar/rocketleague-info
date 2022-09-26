class MatchesController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.match
  end
  def show
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.match.find(params[:id])
    @team_1_scores = @match.score_records

    @team_1_scores = @match.score_records.where(team_id: @match.team_1_id)
    @team_2_scores = @match.score_records.where(team_id: @match.team_2_id)

  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.match.build
  end
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.match.create(match_params)
    @match.save
    redirect_to tournament_matches_path(@tournament)
  end

  def update
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.match.find(params[:id]) #.update(match_params)
    @match.update(match_params)
    redirect_to tournament_matches_path(@tournament)
  end

  def destroy
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.match.find(params[:id])
    @match.destroy
    redirect_to tournament_matches_path(@tournament), status: :see_other
  end

  private

  def match_params
    params.require(:match).permit(:date, :tournament_id, :team_1_id, :team_2_id)
  end

end
