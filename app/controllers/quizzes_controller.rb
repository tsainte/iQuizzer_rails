class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.order("titulo")
  end
  
  def show
    @quiz = Quiz.find(params[:id])
  end
  
  def new 
    @quiz = Quiz.new
  end
  
  def create
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      redirect_to(action: "show", id: @quiz)
    else
      render action: "new"
    end
  end
  
  def edit
    @quiz = Quiz.find(params[:id]) 
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if (@quiz.update_attributes(params[:quiz]))
      redirect_to(action: "show", id: @quiz)
    else
      render action: "edit"
    end
  end
  
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    
    redirect_to(action: "index")
  end
end
