class UsersController < ApplicationController

	layout 'admin'

	before_action :confirm_logged_in
	before_action :find_user, :only => [:edit, :update, :delete, :destroy]

	def index
		@users = User.sorted
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(admin_params)
		if @user.save
			flash[:notice] = 'User "#{@user.first_name}" created successfully'
			redirect_to(users_path)
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @user.update_attributes(admin_params)
			flash[:notice] = 'User "#{@user.first_name}" updated successfully'
			redirect_to(users_path)
		else
			render('edit')
		end
	end

	def delete
	end

	def destroy
		@user.destroy
		flash[:notice] = 'User "#{@user.first_name}" deleted successfully'
		redirect_to(users_path)
	end

	private 

	def find_user
		@user = User.find(params[:id])
	end

	def admin_params
		params.require(:admin_user).permit(:first_name, :last_name, :email, :password)
	end
end
