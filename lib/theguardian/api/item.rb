module Theguardian
	module Api
		class Item < RecursiveOpenStruct
			def initialize(*params)
				content = params.first["content"] ? params.first.merge(params.first["content"]["fields"] ) : params.first
				item_params = params.first["fields"] || content

				super(item_params, params.last)
			end

			def self.process(params)
				connection = Theguardian::Connection.new(resource: params.delete(:id))
				self.new(connection.get(self.process_params(params)), recurse_over_arrays: true)
			end

			def fetch
				self.class.process({ id: URI(self.apiUrl).path })
			end

			def self.process_params(params)
				# The item id
				theguardian_api_params = { id: params[:id] }

				# The show fields
				theguardian_api_params.merge!({ "show-fields" => params[:fields] || "all" }) 

				theguardian_api_params.reject{ |_, value| value.nil? }
			end
		end
	end
end