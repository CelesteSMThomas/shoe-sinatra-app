class User < ActiveRecord::Base
     has_many :shoes 

     has_secure_password
     
     validates :name, :image_url, :email, :password, presence: true
end