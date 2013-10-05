module Theguardian
	module Api
		class Tag < RecursiveOpenStruct
			def self.process(params = {})
				connection = Theguardian::Connection.new(resource: "tags")
				params = self.process_params(params)
				response = connection.get(params)

				response["results"].map do |tag_params|
					self.new(tag_params, recurse_over_arrays: true)
				end
			end

			def fetch
				connection = Theguardian::Connection.new(resource: URI(self.apiUrl).path)

				self.class.new(connection.get, recurse_over_arrays: true)
			end

			def items
				self.results.map do |item_params|
					Theguardian::Api::Item.new(item_params, recurse_over_arrays: true)
				end
			end

			def section
				Theguardian::Api::Section.process(id: self.tag.sectionId)
			end

			def self.process_params(params)
				# Query string and tag type
				theguardian_api_params = { q: params[:q], type: params[:type] }

	 			# Pagination
	 			theguardian_api_params.merge!({ "page" => params[:page] }) if params.has_key?(:page)
	 			theguardian_api_params.merge!({ "page-size" => params[:per_page] }) if params.has_key?(:per_page)

	 			theguardian_api_params.reject{ |_, value| value.nil? }
			end
		end
	end
end