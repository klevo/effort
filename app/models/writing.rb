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
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(hard_wrap: true),
      autolink: true, 
      tables: true,
      fenced_code_blocks: true
    )
    markdown.render content
  end
  
  def self.search(query)
    find_by_sql [%{
      SELECT id, title, project_id, created_at, updated_at, MATCH (title, content) AGAINST (?) AS score 
      FROM writings 
      WHERE MATCH (title, content) AGAINST (?) > 0 OR title LIKE ?
      ORDER BY score DESC, updated_at DESC
      LIMIT 50}, query, query, "%#{query}%"]
  end
end
