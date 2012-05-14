class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    # if user is Admin, redirect to admin
    # if Patient, redirect to survey page.
    if (current_user.role?('Administrator'))
      redirect_to :controller => 'administration/home', :action => 'index'
    else
      # redirect to form.
      redirect_to :controller => 'survey/home', :action => 'index'
    end

  end

  def login
  end

  def support

  end

end
