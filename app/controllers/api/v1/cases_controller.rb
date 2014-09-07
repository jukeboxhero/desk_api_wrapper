class Api::V1::CasesController < ApplicationController

	def index
		response = DESK_CLIENT.cases
		#render Case.parse_json(response['_embedded']['entries'].first.to_json)
	end

end
