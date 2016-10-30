class AdminUsersController < ApplicationController
  
  layout "admin"
  
  before_action :confirm_logged_in

  def index
  	@admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    #Instantiate
    @admin_user = AdminUser.new(admin_user_params)
    #save
    if @admin_user.save
      flash[:notice] = "Admin User created."
       redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    #Find an existing object
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin updated."
       redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'index')
  end

  private
  def admin_user_params
    params.require(:admin_user).permit(:firstname, :lastname, :email, :username, :password)
  end
end
