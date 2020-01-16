class PagesController < ApplicationController

  layout 'admin'
  before_action :confirm_login
  def index
    @page = Page.all
    p pages_path

  end


  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @subject = Subject.all.map{|s| ["#{s.name}(##{s.id})", s.id]}
    
 
    # p params.require(:page).permit(:name, :position, :visible, :permalink)
    
  end
  
  def create
    @page = Page.new(page_params)
     
      @page.save
     
    if  @page.save
      flash[:notice] ="Sections saved successfully."
    redirect_to pages_path
    else 
      p @page.errors
      p params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
      render('new')
    end
  end
  
  def edit
    @page = Page.find(params[:id])
    @subject = Subject.all.map{|s| ["#{s.name}(##{s.id})", s.id]}
  end

  def update
    @page = Page.find(params[:id])
    @subject = Subject.all.map{|s| ["#{s.name}(##{s.id})", s.id]}
    if @page.update_attributes(page_params)
      flash[:notice] ="Sections updated successfully."
      redirect_to pages_path
    else
      render('edit')
    end
  end
  
  def delete
    @page = Page.find(params[:id])
   
    

  end
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] ="Sections deleted successfully."
    redirect_to pages_path

  end

   private
  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end
end

