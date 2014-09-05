class Case < OpenStruct

	def self.parse_json(json)
		self.new.extend(CaseRepresenter).from_json(json)
	end
end