module UI
  module Pages
    class Lifestage < ::UI::Pages::Article
      set_url '/en/lifestages/{/slug}'

      elements :main_content, '.l-2col-main p'
    end
  end
end
