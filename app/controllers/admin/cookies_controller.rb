class Admin::CookiesController < Admin::ApplicationController
  layout 'login'
  skip_before_filter :login?, only: [:login, :logining]

  def login
  end

  def logining
    admin = Admin.find_by_name(params[:name])
    if admin && admin.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = admin.auth_token
      else
        cookies[:auth_token] = admin.auth_token
      end
      flash[:success] = '登陆成功！'
      redirect_to admin_root_path
    else
      flash[:alert] = '账户名或密码错误！'
      redirect_to admin_login_path
    end
  end

  def login_out
    cookies.delete(:auth_token)
    flash[:success] = '用户注销成功！'
    redirect_to admin_login_path
  end
end
