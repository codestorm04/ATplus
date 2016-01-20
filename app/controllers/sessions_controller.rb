class SessionsController < ApplicationController
  def new
    puts 'log_in-----------'
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面
	    log_in user
      #redirect_to user
   
	    puts "ddedendengdengldenglu登陆cchchechenchengchenggchenggochenggonchenggong成功"
	    redirect_to questions_path
    else
      # 创建一个错误消息
      flash[:danger] = 'Invalid email/password combination' # 不完全正确
		  puts "sshshishibshibashibai失败"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
