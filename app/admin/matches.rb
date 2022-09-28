ActiveAdmin.register Match do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :date, :tournament_id, :team_1_id, :team_2_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:date, :tournament_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :user_follow_matches_user_id, as: :select, collection: User.all, label: 'User'
  
end
