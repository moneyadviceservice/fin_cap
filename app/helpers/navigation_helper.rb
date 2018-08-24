module NavigationHelper
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
