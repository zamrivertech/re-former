class UsersController < ApplicationController

  def new
    @user = User.new
    @email_placeholders = ['balls@guru.com', 'guru@balls.com', 
                         'com@guru.balls', 'balls@balls.balls']
    @username_placeholders = ['youareballs', 'ballsareyou',
                             'domainballs', 'patrickjaneballs']
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.expect(user: [ :username, :email, :password ])
    end
end
