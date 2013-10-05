module Theguardian
	class Connection
		attr_accessor :url, :resource

		def initialize(params = {})
			@resource = params[:resource]
			@url = params[:url] || "http://content.guardianapis.com"
		end

		def get(params = {})
			self.parse(RestClient.get("#{@url}/#{resource}", params.merge({ format: "JSON" })))
		end

		def parse(response)
			JSON.parse(response)["response"]
		end
	end
end