class ShoesController < ApplicationController
    #CRUD


#READ; 
#index route for all Shoes
get "/shoes" do
    #leverage the model to get all shoes
    @shoes = Shoe.all
    # render all shoes 
    erb :"shoes/index"
    end

#CREATE NOTE: ORDER MATTERS PUT CREATE FIRST!
# render a form to create a new shoe
get "/shoes/new" do
    if logged_in?
        erb :"shoes/new"
      else
        # show the error message
        flash[:error] = "You must be logged in to add a new shoe!"
        redirect "/"
      end
end

# need another route for create
post "/shoes" do
# recieve the params that the user input in the create new shoe form
# .create creates a new instances AND saves it to our database
# we grab the current user id by using the helper method current_user
shoe = Shoe.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    if shoe.save
    # ^ if valid input — .save triggers our validation
    #if params[:title] != "" && params[:description] != "" && params[:image_url] != ""
      # show shoe creation success message
      flash[:message] = "Created new shoe successfully!"
      # redirect to the shoe show page
      redirect "/shoes/#{shoe.id}"
    else
      # show shoe creation error message
      flash[:error] = "Shoe creation failed: #{shoe.errors.full_messages.to_sentence}"
      redirect "/shoes/new"
    end
end



#show dynamic route for a single shoe
get "/shoes/:id" do
    #find the shoe
    @shoe = Shoe.find(params[:id])

    erb :"shoes/show"
end





#UPDATE
#create a link to edit form on shoe show page
#get route to render an edit form
get "/shoes/:id/edit" do
    @shoe = Shoe.find(params[:id])
    if authorized_to_edit?(@shoe)
        erb :"shoes/edit"
      else
    # show an error message
    flash[:error] = "Not authorized to edit that shoe!"
    redirect "/shoes"
  end

end

#'use Rack::MethodOverride' in 'config.ru'
#patch to send out params to and update new shoe (or resource)
patch "shoes/:id" do
    @shoe = Shoe.find(params[:id])
    @shoe.update(title: params[:title], image_url: params[:image_url], description: params[:description])
    redirect "shoes/#{@shoe.id}"
end


#DELETE
#create link to delete on shoe show page
#'use Rack::MethodOverride' in 'config.ru'
# delete route to delete our shoe
delete '/shoes/:id' do
    binding.pry
    #we need the id to FIND the shoe to delete
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect '/shoes'
end


end