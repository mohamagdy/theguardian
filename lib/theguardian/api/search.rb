module Theguardian
	module Api
		class Search < RecursiveOpenStruct
			def process(params = {})
				connection = Theguardian::Connection.new(resource: "search")
				params = connection.process_params(params)

				self.class.new(connection.get(params), recurse_over_arrays: true)
			end
		end
	end
end