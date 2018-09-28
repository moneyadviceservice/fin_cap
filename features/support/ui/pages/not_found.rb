module UI::Pages
  class NotFound < UI::Page
    set_url '/not_found'
    
    element :logo_link, '.l-1col > a'
  end
end
