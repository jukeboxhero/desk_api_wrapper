class LabelsController < ApplicationController

	def index
		response = DESK_CLIENT.labels
		@labels = Label.parse_json(response.body)
	end

	def new

	end

	def create
		params.delete(:authenticity_token)
		response = DESK_CLIENT.create_label(params)

		if ["200","201"].include? response.code
			flash[:notice] = "Label created successfully."
			redirect_to labels_url
		else
			result = JSON.parse(response.body)
			flash[:error] = result["message"]
			return render :new
		end
	end

end