class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile.
    @user = User.find(params[:user_id]) #this can find which user in logged in
    @profile = @user.build_profile #because we have nested on the routes we can user build_profile for this particular user, needed to create profiles folder at view and new.html.erb
    @variable = params[:hello]
  end
end