class Api::V1::CasesController < ApplicationController

	def index
		@client = DeskClient.new
		response = @client.cases
		#render Case.parse_json(response['_embedded']['entries'].first.to_json)
	end

end
