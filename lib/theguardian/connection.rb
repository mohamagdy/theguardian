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
			p "#{@url}/#{resource}?#{addressable.query}", "==="
			self.parse(RestClient.get("#{@url}/#{resource}?#{addressable.query}"))
		end

		def parse(response)
			JSON.parse(response)["response"]
		end
	end
end