class SubjectsController < ApplicationController
  before_action :confirm_login
  layout 'admin'
  def index
   
     if params[:name]
      @subjects = Subject.search1(params[:name])
  
    else
      @subjects = Subject.all
    end
 
    p params
    # p controller_name
    # p action_name
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.name.downcase!
    p @subjects
    @subject.save
  
    # p subjects_url
    if @subject.save
      flash[:notice] ="Sections created successfully."
      redirect_to(subjects_path)
    else
      render('new')
    end
  
  end


  def edit
    @subject = Subject.find(params[:id])


   
  end

  def update
   
    @subject = Subject.find(params[:id])
    @subject.update_attributes(subject_params)
   if @subject.update_attributes(subject_params)
      @subject.name.downcase!
      flash[:notice] ="Sections updated successfully."
      redirect_to(subject_path(@subject))
    else 
      render('edit')
    end

  end
   
  def delete
    @subject = Subject.find(params[:id])
  end

  def delete_form
    p params
    p controller_name
    p action_name
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
  flash[:notice] ="Sections deleted successfully."
    redirect_to(subjects_path)
  end
  
  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
