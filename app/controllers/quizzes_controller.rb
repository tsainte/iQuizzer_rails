class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @quizzes }
    end
  end
  
  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @quiz }
    end
  end
  
  # GET /quizzes/new
  # GET /quizzes/new.json
  def new 
    @quiz = Quiz.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @quiz }
    end
  end
  
  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(params[:quiz])
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, :notice => 'Quiz was successfully created.' }
        format.json { render :json => @quiz, :status => :created, :location => @quiz }
      else
       # render action: "new"
       format.html { render :new }
       format.json { render :json => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id]) 
  end
  
  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])
    if (@quiz.update_attributes(params[:quiz]))
      #redirect_to(action: "show", id: @quiz)
      redirect_to @quiz, notice: "Sucesso!"
    else
      render :edit
    end
  end
  
  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    
    #redirect_to(action: "index")
    respond_to do |format|
      format.html { redirect_to quizzes_url }
      format.json { head :no_content }
    end
  end
end
