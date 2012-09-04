class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_locale

	def logout
		session['admin_logged']     = nil;
		session['professor_logged'] = nil;
		session['student_logged']   = nil;
		redirect_to "/index.html"
	end

	def current_user
		if ["admin_logged"] == true
			return "admin"
		elsif ["professor_logged"] == true
			return "professor"
		else
			return "estudante"
		end
	end

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	private
		def authentication_check
			authenticate_or_request_with_http_basic do |user, password|
				user == "admin" && password == "hedra21"
			end
		end
end