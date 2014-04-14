class Legacy::Message < ActiveRecord::Base
  establish_connection :legacy

  belongs_to :project
end
