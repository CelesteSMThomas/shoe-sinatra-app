require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# here is where I will mount other controllers with the keyword 'use'
use UsersController
use ShoesController

#in order to send PATCH and DELETE requests we nee the following code:
'use Rack::Method::Override'

run ApplicationController
