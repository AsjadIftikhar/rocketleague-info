class UserFollowMatchesController < InheritedResources::Base

  private

    def user_follow_match_params
      params.require(:user_follow_match).permit(:time_before_notification)
    end

end
