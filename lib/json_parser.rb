module JsonParser
	def self.included(base)
	  base.extend(ClassMethods)
	end
	module ClassMethods
		def parse_json(json)
			json = JSON.parse(json)
			if json['_embedded']
				json = json['_embedded']['entries']
				result = nil

				result = []
				json.each do |entry|
					result << self.new(entry)
				end
			else
				result = self.new(json)
			end

			result
		end
	end
end