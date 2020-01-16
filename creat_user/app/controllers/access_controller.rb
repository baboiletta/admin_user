class AccessController < ApplicationController
  layout 'admin'
  before_action :confirm_login,except: [:login, :attempt_login, :logout]
  def menu
  end

  def login
  end

  def attempt_login


    if params[:user_name].present? && params[:password].present?
   
      found_user = AdminUser.where(user_name: params[:user_name]).first
     
        if found_user
          authorized_user = found_user.authenticate(params[:password])
        end
    end
   
     
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:success] = "Dang nhap thanh cong"
      redirect_to admin_path
    else
      flash.now[:notice] = "Sai roi"
      
      render('login')
      
    end
  end



  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to admin_path
  end
end
