class UsersController < ApplicationController

    #render login form
    get "/login" do
        erb :login
    end

    # recieve(post) the data (params) from the login form
    post "/login" do
        # how to authenticate the user's email and password
        # find the user(find_by activerecord method) by their email
        user = User.find_by(email: params[:email])
        # authenticate the user
        if user && user.authenticate(params[:password])
            # creating a key/value pair in the session hash using the users id to actually log them in
           session[:user_id] = user.id
            # redirect to user's show page
            redirect "/users/#{user.id}"
        else
            #show an error message and redirect to the login screen to try again
            redirect "/login"
        end
    end

        #users SHOW route
        get "/users/:id" do #this is a dynamic route
        "users show page!"
        end
        

end