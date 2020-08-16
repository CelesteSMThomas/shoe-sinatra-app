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

#show route for a single shoe





#UPDATE




#DELETE







end