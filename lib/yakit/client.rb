module Yakit

	class Client
		include YRate
		
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
				if e.response.code.present? && [400,403,404,500,503,599].include?(e.response.code)
		          case e.response.code
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

	end
end