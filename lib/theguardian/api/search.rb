module Theguardian
	module Api
		class Search < RecursiveOpenStruct
			def process(params = {})
				connection = Theguardian::Connection.new(resource: "search")
				self.class.new(connection.get(params), recurse_over_arrays: true)
			end
		end
	end
end