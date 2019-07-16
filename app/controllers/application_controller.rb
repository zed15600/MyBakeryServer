class ApplicationController < ActionController::Base

	if Rails.env.production?
		http_basic_authenticate_with name: "Lithyon", password: "My(4K3Ry", except: [:index, :show]
	end

	def verified_request?
		if request.content_type == "application/json"
			true
		else
			super()
		end
	end

end
