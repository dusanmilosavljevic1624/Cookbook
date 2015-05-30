module SessionsHelper

  #Sign in a user and create a new session
  def sign_in(chef)
    session[:chef_id] = chef.id
  end

  #return the currently logged in user
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end


  def logged_in?
    !current_user.nil?
  end

  #Sign out a user and destroy his session
  def sign_out
    session.delete(:chef_id)
    @current_user = nil
  end
end