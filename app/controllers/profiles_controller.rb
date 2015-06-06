class ProfilesController < ApplicationController
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
  private
  def profile_params
    #This method name has to match the parenthesis above
    #This is the white list
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end