class CasesController < ApplicationController

	def index
		response = DESK_CLIENT.cases(:filter_id => params[:filter_id])
		@cases   = Case.parse_json(response)
	end

end