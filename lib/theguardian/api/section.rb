module Theguardian
	module Api
		class Section < RecursiveOpenStruct
			def self.process(params = {})
				connection = Theguardian::Connection.new(resource: params[:id] || "sections")
				response = connection.get

				if params[:id]
					self.new(response, recurse_over_arrays: true)
				else
					response["results"].map do |section_params|
						self.new(section_params, recurse_over_arrays: true)
					end
				end
			end

			def items
				self.results.map do |item_params|
					Theguardian::Api::Item.new(item_params, recurse_over_arrays: true)
				end
			end

			def fetch
				self.class.process(id: self.id)
			end

			def self.process_params(params)
				params.reject{ |_, value| value.nil? }
			end
		end
	end
end