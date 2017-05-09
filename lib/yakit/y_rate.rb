module Yakit
	module YRate

		def get_shipment_quote(data)

			url = "#{@base_url}/api/yrate/shipmentQuote"

			begin
				response =	RestClient::Request.execute(
							method: :post, 
							url: url,
							user: @username,
							password:@password, 
							payload: "#{data.to_json}",
		                    headers: {:Version => 2, :content_type => 'application/json'}
							)
				response_data = JSON.parse(response.body)
				return response_data

			rescue RestClient::ExceptionWithResponse => e
		        raise StandardException.new if e.response.blank?

		        if e.response.code.present? && [401,400,403,404,500,503,599].include?(e.response.code)
		        	raise_response_exception(e.response,e.message)
		        else
		          raise OtherException.new(e.response), e.message
		        end
		    end

		end
	end
end