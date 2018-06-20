class LifestagesController < FincapTemplatesController
  def resource
    LifestageTemplate.new(Mas::Cms::Lifestage.find(params[:id]))
  end
  helper_method :resource
end