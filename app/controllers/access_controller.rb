class AccessController < ApplicationController

	layout "admin"

	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def home
		# display text & links
		@name = session[:name]
	end

	def login
		# login form
	end

	def attempt_login
		if params[:user_id].present? && params[:password].present?
			found_user = User.where(:user_id => params[:user_id]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end

		if authorized_user
			session[:user_id] = authorized_user.id
			session[:name] = authorized_user.name
			flash[:notice] = "You are now logged in."
			redirect_to(admin_path)
		else
			flash.now[:notice] = "Invalid id/password combination."
			render('login')
		end
	end

	def logout
		session[:user_id] = nil
		session[:name] = nil
		flash[:notice] = 'Logged out'
		redirect_to(access_login_path)
	end
end
