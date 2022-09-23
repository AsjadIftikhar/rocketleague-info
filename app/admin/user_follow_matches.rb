ActiveAdmin.register UserFollowMatch do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :time_before_notification, :user_id, :match_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:time_before_notification]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
