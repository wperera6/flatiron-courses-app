class CoursesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :new]

  

  def index
    @course = Course.all
  end


  def new
    @course = Course.new 
  end

  def create
   @course = Course.new(course_params)
   @course.save

   redirect_to '/'
  end

  def show
  @current_user = current_user
  @courses = Course.all
  @course = Course.find(params[:id])
  end

  def destroy
  @course = Course.find(params[:id])
  @course.destroy

  redirect_to '/'
  end
   
   private 

  def course_params
    params.require(:course).permit(:name)
  end


end
  