module JsonParser
	def self.included(base)
	  base.extend(ClassMethods)
	end
	module ClassMethods
		def parse_json(json)
			json = JSON.parse(json)['_embedded']['entries']
			result = nil

			if json.is_a?(Array)
				result = []
				json.each do |entry|
					result << self.new(entry)
				end
			else
				result = self.new.extend(CaseRepresenter).from_json(json)
			end

			result
		end
	end
end