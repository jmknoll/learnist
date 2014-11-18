class UsersController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to current_user
		end
	end
end
