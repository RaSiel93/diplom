module ApplicationHelper
  def user_role
    t("users.#{current_user.roles.first.name}")
  end
end
