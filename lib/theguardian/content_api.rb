module Theguardian
	class ContentApi	
		def self.search(params = {})
			@search = Theguardian::Api::Search.new
			@search.process(params)
		end
	end
end