class AdminController < ApplicationController
	before_action :confirm_logged_in, :except => [:index, :attempt_login]  

  def index
    @admin = Admin.new
  end

  def attempt_login

  	admin = params[:admin]
  	if admin[:username].present? && admin[:password].present?
  		found_user = Admin.find_by_username(admin[:username])

  		if found_user
  			authorized_user = found_user.authenticate(admin[:password])
  		end
  	end
  
  	if authorized_user
  		session[:admin_id] = authorized_user.id
  		session[:admin_name] = authorized_user.admin_name
  		flash[:notice] = "You are now logged in."
  		redirect_to(:controller => 'customers', :action => 'index')
  	else
  		session[:admin_id] = nil
  		session[:admin_name] = nil
  		flash[:notice] = "Incorrect Username/Password"
 		redirect_to :action => 'index' 		
   	end

  end

  def logout
  	session[:admin_id] = nil
  	session[:admin_name] = nil

  	redirect_to(:controller => 'admin',:action => 'index')
  end

  def show
  	session[:admin_id] = nil
  	session[:admin_name] = nil
  	redirect_to(:action => 'index')
  end



  private

  def confirm_logged_in
  	unless session[:admin_id]
  		flash[:notice] = "Please log in."
  		redirect_to :action => "index"
  		return false
  	else
  		return true
  	end
  end

end

