class LatestNewsPreviewController < NewsController
  def show
    @index_page = LatestNewsTemplate.new(
      Mas::Cms::NewsPreview.find(params[:id], locale: params[:locale])
    )
    render :index
  end
end
