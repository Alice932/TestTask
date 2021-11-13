module Authentication
    extend ActiveSupport::Concern

    included do
        private

        def current_user

            if session[:user_id].present?
                @current_user ||= User.find_by(id: session[:user_id])
            elsif cookies.encrypted[:user_id].present?
                user = User.find_by(id: cookies.encrypted[:user_id])
                sign_in user
                @current_user ||= user
                

            end
                
            
            
        end
    
        
        
        def user_signed_in?
            current_user.present?
        end

        def sign_in(user)
            session[:user_id] = user.id
            
            
        end 

        def remember(user)
            user.remember_me
            cookies.encrypted.permanent[:remember_token] = user.remeber_token
            cookies.encrypted.permanent[:user_id] = user.id

        end
        
    
        helper_method :current_user, :user_signed_in?

        

    end
end