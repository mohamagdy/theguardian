module Theguardian
	class Connection
		attr_accessor :url, :resource

		def initialize(params = {})
			@resource = params[:resource]
			@url = params[:url] || "http://content.guardianapis.com"
		end

		def get(params = {})
			addressable = Addressable::URI.new
			addressable.query_values = params.merge({ format: "JSON" })
			self.parse(RestClient.get("#{@url}/#{resource}?#{addressable.query}"))
		end

		def parse(response)
			JSON.parse(response)["response"]
		end

		def process_params(params)
			theguardian_api_params = { q: params[:q] }

			# Date
			if params.has_key?(:date)
				if params[:date].has_key?(:from)
					theguardian_api_params.merge!({ "from-date" => params[:date][:from].strftime("%Y-%m-%d") })
				end

				if params[:date].has_key?(:to)
					theguardian_api_params.merge!({ "to-date" => params[:date][:to].strftime("%Y-%m-%d") })
				end
			end

			# Tags
 			theguardian_api_params.merge!({ "tag" => params[:tags].join(",") }) if params.has_key?(:tags)

 			# Sections
 			theguardian_api_params.merge!({ "section" => params[:sections].join(",") }) if params.has_key?(:sections) 
 			
 			# Shown fields
 			theguardian_api_params.merge!({ "show-fields" => params[:tags].join(",") }) if params[:tags]
 	
 			# Refinements
 			theguardian_api_params.merge!({ "show-refinements" => params[:refinements].join(",") }) if params.has_key?(:refinements)

 			# Ordering
 			theguardian_api_params.merge!({ "order-by" => params[:order_by] }) if params.has_key?(:order_by)

 			# Pagination
 			theguardian_api_params.merge!({ "page" => params[:page] }) if params.has_key?(:page)
 			theguardian_api_params.merge!({ "page-size" => params[:per_page] }) if params.has_key?(:per_page)

 			theguardian_api_params
		end
	end
end