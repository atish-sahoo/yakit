module Yakit

	class Client
		include YRate
		include YShip
		
		attr_reader :username
		attr_reader :password
		attr_reader :environment
		attr_reader :base_url

		def initialize(username,password,environment= :production)
			@environment = environment
			@base_url = @environment.eql?(:production) ? PRODUCTION_BASE_URL : SANDBOX_BASE_URL
		    @username = username
		    @password = password
		end

		private

			def raise_response_exception(response,message)
				if response.code.present? && [400,403,404,500,503,599].include?(response.code)
		          case response.code
		          	when 401
		              raise Unauthorized.new(response), message
		            when 400
		              raise BadRequest.new(response), message
		            when 403
		              raise Forbidden.new(response), message
		            when 404
		              raise NotFound.new(response), message
		            when 500
		              raise InternalServerError.new(response), message
		            when 503
		              raise ServiceUnavailable.new(response), message
		            when 599
		              raise ConnectionTimedOut.new(response), message
		            else
		              raise OtherException.new(response), message
		            end
		        else
		          raise OtherException.new(response), message
		        end
			end


			def send_get_request(url)

				begin
					response =	RestClient::Request.execute(
								method: :get, 
								url: url,
								user: @username,
								password:@password,
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

			def send_post_request(url,data={})

				begin
					response =	RestClient::Request.execute(
								method: :post, 
								url: url,
								user: @username,
								password:@password,
			                    headers: {:Version => 2, :content_type => 'application/json'},
			                    payload: data.to_json
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

			def send_delete_request(url,data={})

				begin
					response =	RestClient::Request.execute(
								method: :delete, 
								url: url,
								user: @username,
								password:@password,
			                    headers: {:Version => 2, :content_type => 'application/json'},
			                    payload: data.to_json
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

			def send_delete_request(url,data={})

				begin
					response =	RestClient::Request.execute(
								method: :put, 
								url: url,
								user: @username,
								password:@password,
			                    headers: {:Version => 2, :content_type => 'application/json'},
			                    payload: data.to_json
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