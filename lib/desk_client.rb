class DeskClient

	attr_reader :http

	def initialize(url = nil)
		url ||= DESK_API_CONFIG['uri']
		@http = Faraday.new(:url => url)
		@http.basic_auth(DESK_API_CONFIG['username'], DESK_API_CONFIG['password'])
	end

	def cases
		response = @http.get('cases')
		response.body
	end

end