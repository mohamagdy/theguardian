module Theguardian
	module Api
		class Item < RecursiveOpenStruct
			def process(params)
				connection = Theguardian::Connection.new(resource: params[:id])
				self.class.new(connection.get(self.process_params(params)), recurse_over_arrays: true)
			end

			def process_params(params)
				theguardian_api_params = { id: params[:id] }

				theguardian_api_params.merge!({ "show-fields" => params[:fields] || "all" }) 

				theguardian_api_params
			end
		end
	end
end