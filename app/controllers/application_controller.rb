require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable sessions hash
    enable :sessions
    # set session secret for an extra layer of security
    set :session_secret, "super_cali_fragilistic_expialidocious"
    register Sinatra::Flash
  end

  get "/" do
    #if you're logged in you see your home page
    if logged_in? 
      redirect "/users/#{current_user.id}"
    end
    #else you see the welcome page
    erb :welcome
  end

  helpers do
    #find user by the key/value pair created in post '/login' session hash
    def current_user
      #keeps track of the logged in user
        User.find_by(id: session[:user_id])
    end

#returns a boolean(true/false) if the user is logged in or not
    def logged_in?
      #it is a double bang to convert to a hard true or hard false
        !!current_user
    end

      # create an authorization helper for edit/delete
      def authorized_to_edit?(shoe)
        shoe.user == current_user
      end
  end

end
