class TopsController < ApplicationController
    def main
        render 'login'
    end

    def login
        user = User.find_by(email: params[:email])
        if user and BCrypt::Password.new(user.pass) == params[:pass]
          #TODO: ログイン成功したことをユーザに知らせる
          session[:login_email] = user.email
          redirect_to root_path
        else
          #TODO: エラーメッセージ
          render 'login'
        end
    end

    def logout
        #TODO: ログアウトに成功したことをユーザに知らせる
        session.delete(:login_email)
        redirect_to root_path
    end
end
