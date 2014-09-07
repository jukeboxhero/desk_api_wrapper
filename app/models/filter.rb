class Filter < OpenStruct

	include JsonParser

	def id
		return nil unless self._links
		link = self._links["self"]["href"]
		link.gsub('/api/v2/filters/', '').try(:to_i)
	end

end