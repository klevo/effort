class Writing < ActiveRecord::Base
  belongs_to :project

  scope :latest, -> { order created_at: :desc }
end
