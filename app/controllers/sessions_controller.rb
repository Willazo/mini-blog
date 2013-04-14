class SessionsController < ApplicationController
  skip_before_filter :require_admin, :only => [:new, :create]
  def new
  end

  def create
  	# Try to find an admin by email and authenticate with password
  	if @admin = Admin.find_by_email(params[:admin][:email]).try(:authenticate, params[:admin][:password])
  		# On success save Admin ID in current session
  		session[:admin_id] = @admin.id
  		# Redirect to posts
  		redirect_to posts_path
  	else
  		# On failure render login form and show error message
  		redirect_to new_session_path, alert: "Not recognized email or password"
  	end
  end
  	def destroy
  		# Delete Admin ID from session
  		session.delete(:admin_id)
  		redirect_to posts_path, notice: "Have a nice day!"
  	end
  end

