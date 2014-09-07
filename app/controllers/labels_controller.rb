class LabelsController < ApplicationController

	def index
		response = DESK_CLIENT.labels
		@labels = Label.parse_json(response)
	end

end