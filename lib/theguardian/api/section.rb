module Theguardian
	module Api
		class Section < RecursiveOpenStruct
			def self.process
				connection = Theguardian::Connection.new(resource: "sections")
				self.new(connection.get, recurse_over_arrays: true)
			end

			def self.process_params(params)
				params
			end
		end
	end
end