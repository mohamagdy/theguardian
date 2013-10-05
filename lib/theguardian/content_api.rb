module Theguardian
	class ContentApi	
		def self.search(params = {})
			@search = Theguardian::Api::Search.new
			@search.process(params)
		end

		def self.search_tags(params = {})
			@tag = Theguardian::Api::Tag.new
			@tag.process(params)
		end
	end
end