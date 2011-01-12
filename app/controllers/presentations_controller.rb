class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.build(params[:presentation])
    if(@presentation.save)
      flash[:success] = "Presentation '#{@presentation}' created!"
      redirect_to presentation_path(@presentation)
    else 
      flash[:error] = "FAIL!<br>#{@presentation.errors.full_messages.join("<br>")}"
      render :new
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update_attributes(params[:presentation])
      flash[:success] = "Presentation '#{@presentation}' updated!"
      redirect_to presentation_path(@presentation)
    else
      flash[:error] = "FAIL!<br>#{@presentation.errors.full_messages.join("<br>")}"
      render :edit
    end
  end

  def delete
  end
end
