class Project < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }
end
