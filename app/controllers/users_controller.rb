class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to(new_ballot_path, :notice => 'New Ballot')
    else
      flash.now[:alert] = @user.errors.full_messages[0]
      render :action => :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :badge)
    end

end
