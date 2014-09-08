class CasesController < ApplicationController

	def index
		opts = {:filter_id => params[:filter_id]} if params[:filter_id]
		response = DESK_CLIENT.cases(opts)
		@cases   = Case.parse_json(response.body)
	end

	def edit
		response = DESK_CLIENT.case(params[:id])
		@case    = Case.parse_json(response.body)
		response = DESK_CLIENT.labels
		@labels  = Label.parse_json(response.body)
	end

	def update
		params.delete(:authenticity_token)
		params.merge!(:label_action => 'replace')
		response = DESK_CLIENT.update_case(params[:id], params)

		if ["200","201"].include? response.code
			flash[:notice] = "Case update successfully."
			redirect_to cases_url
		else
			result = JSON.parse(response.body)
			flash[:error] = result["message"]
			return render edit_case_url(params[:id])
		end
	end

end