class ThingsController < ApplicationController
	before_filter :authenticate_user!
end
