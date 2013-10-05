module Theguardian
	class ContentApi	
		def self.search(params = {})
			Theguardian::Api::Search.process(params)
		end

		def self.search_tags(params = {})
			Theguardian::Api::Tag.process(params)
		end

		def self.sections
			Theguardian::Api::Section.process
		end

		def self.item(params)
			Theguardian::Api::Item.process(params)
		end	
	end
end