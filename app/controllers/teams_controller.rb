class TeamsController < InheritedResources::Base

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @team = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to(:controller => 'teams', :action => 'index')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to(:controller => 'teams', :action => 'index')
  end

  private

  def team_params
    params.require(:team).permit(:name, :banner)
  end

end
