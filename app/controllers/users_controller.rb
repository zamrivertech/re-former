class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.new(user_params).save
  end

  private
    def user_params
      params.expect(user: [ :username, :email, :password ])
    end
end
