class Administration::HomeController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  layout 'admin', :only=>[:index]

  def index
    @user = current_user
    respond_to do |format|
      format.html # index.html.haml
    end
  end

  def managestaff

  end

  def managepatient

    @user = User.new
  end


  def support

  end

  respond_to :json
  def patientdata
    @patients = User.joins(:roles).where('roles.name = ?', 'Patient')
    @patients_json = []
    @patients.each do |patient|
      @patients_json <<
          [
          patient.firstname,
          patient.lastname,
          patient.username,
          patient.birthday,
          patient.mrn
          ]
    end

    render :json => {:aaData => @patients_json}
    #respond_with(@patients) do |format|
    #  format.json {render :json=>@patients.to_json(
    #      :only => [:firstname, :lastname, :username, :mrn, :email]
    #  )}
    #end
  end


  respond_to :js
  def getpatientbymrn
    @user = User.find_last_by_mrn(params[:mrn])
     respond_to do |format|
       format.js
     end
  end

end
