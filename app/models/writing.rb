class Writing < ActiveRecord::Base
  belongs_to :project, touch: true

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
  
  def content_as_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render content
  end
end
