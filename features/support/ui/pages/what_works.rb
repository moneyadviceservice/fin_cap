module UI
  module Pages
    class WhatWorks < ::UI::Pages::Article
      set_url '/en/what_works/{/slug}'

      elements :main_content, '.l-2col-main p'
    end
  end
end
