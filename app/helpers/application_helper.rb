module ApplicationHelper
  
  def page_title
    controller_name.titleize
  end
  
  def index_links(resource)
    content_tag :div, class: 'button-group small index-links' do
      concat link_to 'Show', resource, class: 'button secondary'
      concat link_to 'Edit', [:edit, resource], class: 'button success'
      concat link_to 'Destroy', resource, :method => :delete, :data => { :confirm => 'Are you sure?' }, class: 'button alert'
    end
  end
  
end
