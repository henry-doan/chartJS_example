class RobotsController < ApplicationController
	def by_industry
		render json: {robots: Robot.by_industry}
	end
end
