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

	def url(endpoint, opts={})
		result = "#{@uri}#{endpoint}"
		unless opts.blank?
			parms = opts.to_param
			result = "#{result}?#{parms}"
		end
		result
	end

	# list
	def filters
		@http.get(url('filters'))
	end

	# list
	def cases(opts={})
		@http.get(url('cases', opts))
	end

	# show
	def case(id)
		@http.get(url("cases/#{id}"))
	end

	# update
	def update_case(id, opts)
		@http.put(url("cases/#{id}", opts))
	end

	# list
	def labels
		@http.get(url('labels'))
	end

	# create
	def create_label(opts={})
		@http.post(url('labels', opts))
	end

end