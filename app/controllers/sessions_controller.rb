class SessionsController < ApplicationController
 def new
 end

 def create
   user = User.find_by(badge: params[:session][:badge])
   if user
     sign_in user
     redirect_to ballots_path(current_user)
   else
     flash.now[:error] = 'Badge Number Not Registered'
   render 'new'
   end
 end

 def destroy
 end
end
