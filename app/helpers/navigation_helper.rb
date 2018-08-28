module NavigationHelper
  WHAT_FIN_CAP = {
    'Financial capability levels in the UK' => Rails.application.routes.url_helpers.article_path('en', 'levels-uk'),
    'Financial capability - a global issue' => Rails.application.routes.url_helpers.article_path('en', 'global-issue')
  }.freeze

  WHO_FOR = {
    'Financial services' => Rails.application.routes.url_helpers.article_path('en', 'financial-services'),
    'Charities and third-sector organisations' => Rails.application.routes.url_helpers.article_path('en', 'charities-third-sector-organisations'),
    'Employers' => Rails.application.routes.url_helpers.article_path('en', 'employers'),
    'Researchers' => Rails.application.routes.url_helpers.article_path('en', 'researchers'),
    'Schools' => Rails.application.routes.url_helpers.article_path('en', 'schools'),
    'Parents' => Rails.application.routes.url_helpers.article_path('en', 'parents'),
    'Childrens services' => Rails.application.routes.url_helpers.article_path('en', 'childrens-services'),
    'Youth and students' => Rails.application.routes.url_helpers.article_path('en', 'youth-students'),
    'Individuals' => Rails.application.routes.url_helpers.article_path('en', 'individuals')
  }

  def render_level_1_heading(text)
    render 'navigation/level_1_heading', text: text
  end

  def render_level_2_heading(text)
    render 'navigation/level_2_heading', text: text
  end

  def render_level_2_subcategory_heading(text, link)
    render 'navigation/level_2_subcategory_heading', text: text, link: link
  end

  def render_level_2_extended_heading(text)
    render 'navigation/level_2_extended_heading', text: text
  end

  def render_level_2_subcategory_link(text, link)
    render 'navigation/level_2_subcategory_link', text: text, link: link
  end

  def render_level_3_heading(text)
    render 'navigation/level_3_heading', text: text
  end

  def render_level_3_subcategory_btn(text, link)
    render 'navigation/level_3_subcategory_btn', text: text, link: link
  end

  def render_level_3_subcategory_link (text, link)
    render 'navigation/level_3_subcategory_link', text: text, link: link
  end
end
