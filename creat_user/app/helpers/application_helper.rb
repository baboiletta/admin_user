module ApplicationHelper

    def status_tag(s_visible)
        s_visible ?  content_tag(:span, '',  class: 'status true')
    : content_tag(:span, '', class: 'status false' )
    end
  
end
