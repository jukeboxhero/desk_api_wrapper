class CasesController < ApplicationController

	def index
		@client  = DeskClient.new
		response = @client.cases
		@cases   = Case.parse_json(response)
	end

end