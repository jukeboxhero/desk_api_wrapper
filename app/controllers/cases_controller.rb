class CasesController < ApplicationController

	def index
		@client  = DeskClient.new
		cases_response = @client.cases
		filters_response = @client.filters
		@cases   = Case.parse_json(cases_response)
		@filters = Filter.parse_json(filters_response)
	end

end