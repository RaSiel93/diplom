module ApplicationHelper
  def username
    current_user.email.gsub!(/@.+/, '')
  end

  def user_role
    t("users.#{current_user.roles.first.name}")
  end
end
