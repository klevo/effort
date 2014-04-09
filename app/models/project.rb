class Project < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }

  has_many :todo_lists

  def to_param
    [id, name].join(' ').parameterize
  end
end
