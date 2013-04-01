module ApplicationHelper
  
  def facebook_url
    "pm"
  end
  
  def title(page_title, options={})
    title = "#{page_title} | Project Management"
    content_for(:title, truncate(title, :length => 75))
    content_for(:page_header, page_title)
    
    if request.xhr?
      content_tag(:h1, page_title, options) + content_tag(:title, title)
    else
      content_tag(:h1, page_title, options)
    end
  end

  def description(page_description)
    content_for(:description, truncate(strip_tags(page_description), :length => 150))
  end
  
end

class String
  include ActionView::Helpers::SanitizeHelper
  
  def to_markdown
    RedCloth.new(sanitize(self)).to_html.html_safe
  end
end

class NilClass
  def to_markdown
  end
end