class Legacy::Project < ActiveRecord::Base
  establish_connection :legacy
end
