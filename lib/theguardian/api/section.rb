module Theguardian
	module Api
		class Section < RecursiveOpenStruct
			def self.process(params = {})
				connection = Theguardian::Connection.new(resource: params.delete(:id) || "sections")
				self.new(connection.get, recurse_over_arrays: true)
			end

			def self.process_params(params)
				params.reject{ |_, value| value.nil? }
			end
		end
	end
end