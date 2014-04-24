class Writing < ActiveRecord::Base
  belongs_to :project

  scope :latest, -> { order created_at: :desc }

  validates_presence_of :title

  def to_param
    [id, title].join(' ').parameterize
  end
end
