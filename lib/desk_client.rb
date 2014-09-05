class DeskClient

	attr_reader :http, :uri

	def initialize(url = nil)
		@uri ||= DESK_API_CONFIG['uri']

		consumer = OAuth::Consumer.new(
        	DESK_API_CONFIG['key'],
        	DESK_API_CONFIG['secret'],
        	:site => url,
        	:scheme => :header
		)

		@http = OAuth::AccessToken.from_hash(
		        consumer,
		        :oauth_token => DESK_API_CONFIG['access_token'],
		        :oauth_token_secret => DESK_API_CONFIG['access_secret']
		)
	end

	def url(endpoint)
		"#{@uri}#{endpoint}"
	end

	def filters
		response = @http.get(url('filters'))
		render_response(response)
	end

	def cases
		response = @http.get(url('cases'))
		render_response(response)
	end

	def render_response(response)
		case response.code.try(:to_i)
		when 200
			response.body
		when 401
			raise "Unauthorized user"
		else
			raise "There was an error: #{response.body}"
		end
	end

end