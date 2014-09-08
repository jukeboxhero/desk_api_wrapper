class LabelsController < ApplicationController

	def index
		response = DESK_CLIENT.labels
		@labels = Label.parse_json(response)
	end

	def new

	end

	def create
		params.delete(:authenticity_token)
		response = DESK_CLIENT.create_label(params)
	end

end