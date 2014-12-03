class ThingsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@things = Thing.all
	end

	def new
		@thing = Thing.new
	end

	def create
		@thing = current_user.things.build(thing_params)
		if current_user.things.count >= 3
			redirect_to current_user, alert: "Trying to learn too many things at once is a surefire way to fail. "
		elsif @thing.save 
			redirect_to current_user, notice: "New Goal Succesfully Added"
		else
			redirect_to current_user
		end

	end

	private

	def thing_params
		params.require(:thing).permit(:title, :content)
	end

end
