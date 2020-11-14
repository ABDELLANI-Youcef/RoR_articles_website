class ImageElementsController < ApplicationController
  def create
    @element_element = article.build(params[:element_element])
    if @element_element.save
      flash[:success] = 'article successfully created'
    else
      flash[:error] = 'Could not create image element'
    end
  end

  def update
    @image_element = article.find(image_element_params)
    if @image_element.image.attach(params[:image])
      flash[:success] = 'article was successfully updated'
      redirect_to @image_element
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def image_element_params
    params.require(:article).permit(:title, :text)
  end
end
