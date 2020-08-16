class UsersController < ApplicationController

    #render login form
    get '/login' do
        erb :login
    end

    # recieve(post) the data (params) from the login form
    post '/login' do
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
            redirect "/users/login"
        end
    end

        #users SHOW route
        get '/users/:id' do #this is a dynamic route
    # find the user
        @user = User.find_by(id: params[:id])
        erb:'/users/show'
        end

        # SIGN UP ROUTE
        # get sign up route that renders the signup form
        get '/signup' do
            #render my sign form erb
            erb :'/users/signup'
        end

        #post sign up route that recieves the input data from the user, creates the user, and logs the user in
        post '/users' do
            # will add validations to inputs later to make sure all inputs are filled out prior to creating user
            @user = User.create(params)
            #this allows us to use all params as our argument in the user.rb file when creating a new user.
            #post sign up route to creat user using params and add key/value pair to sessions hash
            session[:user_id] = @user.id
            # redirect to user profile
            redirect "/users/#{@user.id}"
        end


        #LOG OUT 
        #get logout that clears the session hash
        get '/logout' do
            session.clear

            #redirect back to homepage
            redirect "/"
        end
        

end