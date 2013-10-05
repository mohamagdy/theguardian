module Theguardian
	module Api
		class Tag < RecursiveOpenStruct
			def self.process(params = {})
				connection = Theguardian::Connection.new(resource: "tags")
				params = self.process_params(params)

				self.new(connection.get(params), recurse_over_arrays: true)
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