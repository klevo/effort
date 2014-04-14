class Legacy::Message < ActiveRecord::Base
  establish_connection :legacy
end
