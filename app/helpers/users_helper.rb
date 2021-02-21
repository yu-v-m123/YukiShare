module UsersHelper
  def login?
    current_user.nil?
  end
end
