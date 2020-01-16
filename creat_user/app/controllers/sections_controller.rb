class SectionsController < ApplicationController

  layout 'admin'
  before_action :confirm_login
  def index
    @section = Section.all
    p params
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new 
    @page = Page.all.map{|s| ["#{s.name} (##{s.id})", s.id]}
  end

  def create
    @section = Section.new(section_params)
    @page = Page.all.map{|s| ["#{s.name} (##{s.id})", s.id]}
    @section.save
    if @section.save 
      flash[:notice] ="Sections created successfully."
      redirect_to sections_path
    else
      render("new")
    end
  end
 

  def edit
    @section = Section.find(params[:id])
    @page = Page.all.map{|s| ["#{s.name} (##{s.id})", s.id]}
   
  end

  def update
    @section = Section.find(params[:id])
    @page = Page.all.map{|s| ["#{s.name} (##{s.id})", s.id]}
    p params
    if @section.update_attributes(section_params)
      flash[:notice] ="Sections updated successfully."
      redirect_to sections_path
    else
      render("edit")
    end
  end
  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
   @section.destroy
   flash[:notice] ="Sections deleted successfully."
      redirect_to sections_path
  
  end

  private
  def section_params
    params.require(:section).permit(:name, :position, :page_id, :visible)
  end
end
