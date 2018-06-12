class DocumentsPreviewController < ApplicationController
  def show
    controller_class = "#{page_type}_preview_controller"
    controller_class.classify.constantize.dispatch('show', request, response)
  end

  private

  def page_type
    params[:page_type]
  end
end
