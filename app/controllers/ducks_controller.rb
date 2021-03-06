class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def new 
    @duck = Duck.new 
    @students = Student.all 
    render :new 
  end 

  def show 
    @duck = Duck.find(params[:id]) 
  end 

  def create 
    @duck = Duck.new(student_params) 

    if @duck.save 
      redirect_to duck_path(@duck) 
    else  
      flash[:errors] = @duck.errors.full_messages 
      redirect_to new_duck_path 
    end 
  end 

  def edit 
    @duck = Duck.find(params[:id]) 
    @students = Student.all 
  end 

  def update 
    @duck = Duck.find(params[:id]) 

    if @duck.update(duck_params) 
      redirect_to duck_path(@duck) 
    else  
      flash[:errors] = @duck.errors.full_messages 
      redirect_to edit_duck_path 
    end 
  end 

  def destroy  
    @duck = Duck.find(params[:id]) 
    @duck.destroy 
    redirect_to ducks_url 
  end 

  private 

  def duck_params 
    params.require(:duck).permit(:name, :description, :student_id)  
  end 
end
