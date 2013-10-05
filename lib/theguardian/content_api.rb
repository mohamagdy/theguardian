module Theguardian
	class ContentApi	
		def self.search(params = {})
			@search = Theguardian::Api::Search.new(params)
			@search.process
		end
	end
end