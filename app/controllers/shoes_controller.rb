class ShoesController < ApplicationController
    #CRUD

#CREATE




#READ; 
#index route for all Shoes
get '/shoes' do
#leverage the model to get all shoes
@shoes = Shoe.all
# render all shoes 
erb :'shoes/index'
end

#show dynamic route for a single shoe
get '/shoes/:id' do
    @shoe = Shoe.find_by(id: params[:id])

    erb :"/shoes/show"
end





#UPDATE




#DELETE







end