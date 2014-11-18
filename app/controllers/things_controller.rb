class ThingsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@things = Thing.all
	end

	def new
		@thing = Thing.new
	end

	def create
		@thing = Thing.new(thing_params)
		if @thing.save 
			redirect_to current_user, notice: "New Goal Succesfully Added"
		else
			redirect_to current_user
		end
	end

	private

	def thing_params
		params.require(:thing).permit(:title, :content, :user_id)
	end

end
