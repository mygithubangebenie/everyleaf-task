class ApplicationController < ActionController::Base
    def self.search(term)
        if term
          where('status LIKE ?', "%#{term}%").order('id DESC')
          where('content LIKE ?', "%#{term}%").order('id DESC')
        else
          order('id DESC')
      end
    end
    def new
    end
    
    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end
    private
    
    def user_params
      params.require(:user).permit(:usertype, :name, :email, :password)
    end
    protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
