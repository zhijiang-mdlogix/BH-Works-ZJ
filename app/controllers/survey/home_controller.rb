class Survey::HomeController < ApplicationController

  layout 'survey'

  def index
    @user = current_user

    #TODO Get first survey here, need implement SAAS feature by adding survey code or something else.
    @survey = Survey.first
  end
end
