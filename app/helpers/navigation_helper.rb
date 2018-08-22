module NavigationHelper
  def render_level_1_heading(text)
    render 'navigation/level_1_heading', text: text
  end

  def render_level_2_heading(text)
    render 'navigation/level_2_heading', text: text
  end
end
