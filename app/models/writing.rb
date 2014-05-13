class Writing < ActiveRecord::Base
  belongs_to :project

  scope :latest, -> { order created_at: :desc }

  validates_presence_of :title

  def to_param
    [id, title].join(' ').parameterize
  end
  
  def title_or_no_title
    if title.blank?
      'no title'
    else
      title
    end
  end
end
