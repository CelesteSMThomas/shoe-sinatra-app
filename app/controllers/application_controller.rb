require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable sessions hash
    enable :sessions
    # set session secret for an extra layer of security
    set :session_secret, "supercalifragilisticexpialidocious"
  end

  get "/" do
    erb :welcome
  end

end
