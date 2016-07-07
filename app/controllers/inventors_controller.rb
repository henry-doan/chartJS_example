class InventorsController < ApplicationController
	def hired
		render json: { records: Inventor.hired }
	end
end
