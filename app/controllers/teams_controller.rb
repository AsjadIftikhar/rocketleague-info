class TeamsController < InheritedResources::Base

  private

    def team_params
      params.require(:team).permit(:name)
    end

end
