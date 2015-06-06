class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  def new
    # form where a user can fill out their own profile.
    @user = User.find(params[:user_id]) #this can find which user in logged in
    #@profile = @user.build_profile #because we have nested on the routes we can user build_profile for this particular user, needed to create profiles folder at view and new.html.erb
    @profile = Profile.new # the previous will unlike the profile that was created before. That's why we use this line instead.
  end
  def create
    @user = User.find(params[:user_id]) #Over here i indicate that i want to create a profile to THIS specific logged in user
    @profile = @user.build_profile(profile_params) #this time I'm passing parameters on the parenthesis to profile, dont forget to white list params
    if @profile.save #If i can save
      flash[:success] = "Profile Updated!"
      redirect_to user_path(params[:user_id])
    else
      render action: :new
    end
  end
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile #pulling the contact with the information added previously
  end
  def update
    @user = User.find(params[:user_id]) #getting the user
    @profile = @user.profile #using the profile from the user i got
    if @profile.update_attributes(profile_params) #i already white listed this
      flash[:success] = "Profile Updated."
      redirect_to user_path(params[:user_id])
    else
      flash[:danger] = "Error"
      render action: :edit
    end
  end
  private
  def profile_params
    #This method name has to match the parenthesis above
    #This is the white list
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
  def only_current_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user
  end
end