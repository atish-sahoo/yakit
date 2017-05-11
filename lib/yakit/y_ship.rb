module Yakit
	module YShip

		def list_open_jobs
			url = "#{@base_url}/api/yship/listOpenJobs"
			send_get_request(url)
		end

		def get_job_detail(job_id)
			url = "#{@base_url}/api/yship/jobDetail?jobId=#{job_id}"
			send_get_request(url)
		end

		def get_quote_for_job(job_id)

			url = "#{@base_url}/api/yship/quoteForJob?jobId=#{job_id}"
			send_get_request(url)
		end

		def create_job
			url = "#{@base_url}/api/yship/createJob"
			send_post_request(url)
		end

		def close_job(job_id)
			url = "#{@base_url}/api/yship/closeJob"
			data = {"jobId" => job_id}
			send_post_request(url,data)
		end

		def delete_job(job_id)
			url = "#{@base_url}/api/yship/deleteJob"
			data = {"jobId" => job_id}
			send_delete_request(url,data)
		end

		def payment_for_job(data)
			url = "#{@base_url}/api/yship/paymentForJob"
			send_post_request(url,data)
		end

		def get_open_shipments
			url = "#{@base_url}/api/yship/openShipments"
			send_get_request(url)
		end

		def add_shipment(data)
			url = "#{@base_url}/api/yship/addShipment"
			send_post_request(url,data)
		end

		def update_shipment(data)
			url = "#{@base_url}/api/yship/updateShipment"
			send_post_request(url,data)
		end

		def get_shipment_details(shipment_id)
			url = "#{@base_url}/api/yship/shipmentDetails?shipmentId=#{shipment_id}"
			send_get_request(url)
		end

		def get_shipment_label(shipment_id,label_format="PDF")
			url = "#{@base_url}/api/yship/shipmentLabel?shipmentId=#{shipment_id}&labelFormat=#{label_format}"
			send_get_request(url)
		end

		def delete_shipment(shipment_id)
			url = "#{@base_url}/api/yship/shipment"
			data = {"shipmentId" => shipment_id}
			send_delete_request(url,data)
		end

		def get_shipment_groups(job_id)
			url = "#{@base_url}/api/yship/shipmentGroups?jobId=​#{job_id}"
			send_get_request(url)
		end

		def create_container(job_id)
			url = "#{@base_url}/api/yship/createContainer"
			data = {"jobId" => job_id}
			send_post_request(url,data)
		end

		def update_container(data)
			url = "#{@base_url}/api/yship/updateContainer"
			send_post_request(url,data)
		end

		def delete_container(container_id)
			url = "#{@base_url}/api/yship/container"
			data = {"containerId" => container_id}
			send_delete_request(url,data)
		end

		def add_shipments_to_container(container_id,shipment_ids)
			url = "#{@base_url}/api/yship/addShipmentsToContainer"
			data = {"containerId" => container_id,"shipmentIds" => shipment_ids}
			send_put_request(url,data)
		end

		def delete_shipments_from_container(container_id,shipment_ids)
			url = "#{@base_url}/api/yship/deleteShipmentsFromContainer"
			data = {"containerId" => container_id,"shipmentIds" => shipment_ids}
			send_post_request(url,data)
		end

		def close_container(data)
			url = "#{@base_url}/api/yship/closeContainer"
			send_post_request(url,data)
		end

		def get_container_label(container_id,label_format="PDF")
			url = "#{@base_url}/api/yship/containerLabel?containerId=#{container_id}&labelFormat=#{label_format}"
			send_get_request(url)
		end

		def dispatch_job(job_id)
			url = "#{@base_url}/api/yship/dispatchJob"
			data = {"jobId" => job_id}
			send_post_request(url,data)
		end
	end
end