class User::SessionsController < Devise::SessionsController
  def new
    @user = User.new
    @user.login='lastcow'
  end
end
