class UserFollowMatchesController < ActionController::Base
  before_action :authenticate_user!
  load_and_authorize_resource except: [:follow_match]

  def follow_match
    user_follow_match = UserFollowMatch.create(
      user_id: current_user.id,
      match_id: params[:id].to_i,
      hours_before_notification: 1
    )
    user_follow_match.save

    redirect_to "/"

  end

  private

  def user_follow_match_params
    params.require(:user_follow_match).permit(:user_id, :match_id, :hours_before_notification)
  end

end
