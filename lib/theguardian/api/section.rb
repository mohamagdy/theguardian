module Theguardian
	module Api
		class Section < RecursiveOpenStruct
			def process
				connection = Theguardian::Connection.new(resource: "sections")
				self.class.new(connection.get, recurse_over_arrays: true)
			end

			def process_params(params)
				params
			end
		end
	end
end