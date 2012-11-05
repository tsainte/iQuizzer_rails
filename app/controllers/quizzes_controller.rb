class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end
  
  def show
    @quiz = Quiz.find(params[:id])
  end
  
  def new 
    @quiz = Quiz.new
  end
  
  def create
    print "createeeeeeeeeeeeeeee"
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      redirect_to @quiz, notice: "Sucesso!"
    else
     # render action: "new"
     render :new
    end
  end
  
  def edit
    @quiz = Quiz.find(params[:id]) 
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if (@quiz.update_attributes(params[:quiz]))
      #redirect_to(action: "show", id: @quiz)
      redirect_to @quiz, notice: "Sucesso!"
    else
      render action: "edit"
      #render :edit
    end
  end
  
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    
    redirect_to(action: "index")
  end
end
