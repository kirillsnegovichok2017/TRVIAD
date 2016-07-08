module ApplicationHelper

  #Returns the full titile on a per-page basis.

  def full_title(page_title= '')
    base_title = "Ruby Social Network"
    (page_title.empty?) ? base_title : "#{page_title} | #{base_title}"
  end
end
