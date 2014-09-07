class FiltersController < ApplicationController

	def index
		response = DESK_CLIENT.filters
		@filters = Filter.parse_json(response)
	end

end