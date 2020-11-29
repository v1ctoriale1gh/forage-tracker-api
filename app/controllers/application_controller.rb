class ApplicationController < ActionController::API
    helper_method :logged_in?, :require_login, :current_user, :allowed_user
    
    def current_user
      #byebug
      current_user||= User.find_by(:id => session[:user_id]) #if !!session[:user_id] 
    end

      def logged_in?
        #byebug
        !!session[:user_id]
      end

      def require_login
        unless logged_in?
            #byebug
            render json: { error: 'Please log in' }
        end
        end

    def allowed_user(params_user, rendee)
     if current_user == params_user
      #byebug
        render json: rendee 
     else 
        render json: { error: '' }
      end
    end
end
