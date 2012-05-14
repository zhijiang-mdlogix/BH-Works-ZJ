class User::RegistrationsController < ApplicationController
  respond_to :html, :js
  # GET /resource/sign_up
  def newpatient
    @user = User.new
  end

  # POST /resource
  def create
    begin
      @newpatient = User.new(params[:user])
      #Set username as MRN, role as patient.
      @newpatient.username=@newpatient.mrn
      @newpatient.roles = Role.find_all_by_name('Patient')
      #TODO Email using MRN@MDLOGIX.com for now
      @newpatient.email = @newpatient.mrn + '@mdlogix.com'
      @newpatient.save!
      flash[:notice] = "Patient created successfully";
      #Try save user.
    rescue Exception=>ex
      #TODO Log it.
    end

    # new user entity for fresh form.
    @user = User.new;
    respond_with(@newpatient, :layout => !request.xhr? )
  end

  # POST /resource
  def update

    begin
      updateUser = User.find(params[:user][:id])
      updateUser.update_attributes(params[:user])
    rescue Exception=>ex
      #TODO log it
    end

    # Used for reset form.
    @user = User.new
    #Respond
    respond_with(updateUser, :layout => !request.xhr? )
  end
end
