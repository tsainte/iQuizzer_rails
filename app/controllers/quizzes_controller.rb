class QuizzesController < ApplicationController
  before_filter :authenticate_user!
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
      perguntas = mountPerguntas(@quiz.perguntas)
      format.json { render :json => { :quiz => @quiz },  :include => { :perguntas => { :include =>  :respostas } } }
    end
  end
  
  def mountPerguntas (perguntas)
    arrayPerguntas = Array.new()
    
    perguntas.each do |pergunta|
      

    end
  end
  # GET /quizzes/new
  # GET /quizzes/new.json
  def new 
    @quiz = Quiz.new
    #pergunta = @quiz.perguntas.build
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @quiz }
    end
  end
  
  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(params[:quiz])
    if request.format == :html then
      @quiz.user_id = current_user.id
    else
        @quiz.user_id = params[:user_id]
    end
    respond_to do |format|
      
      if @quiz.save
        incrementPoints(:new,0)
        format.json { render :json => @quiz, :status => :created, :location => @quiz }
        format.html { redirect_to @quiz, :notice => 'Quiz was successfully created.' }
      else
       # render action: "new"
       format.html { render :new }
       format.json { render :json => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end
  def incrementPoints(mode, qtdperg)
    
    if mode == :new then
      squiz = 100
      sperg = 20 * @quiz.perguntas.count
    else
      squiz = 0
      sperg = 20 * qtdperg
    end
    score = squiz + sperg
    
    user = @quiz.user
    if user.scorecreator == nil then
      user.scorecreator = 0 + score
    else
      user.scorecreator = user.scorecreator + score
    end
    user.save
  end
  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id]) 
  end
  
  # PUT /quizzes/1
  # PUT /quizzes/1.json
  def update
    @quiz = Quiz.find(params[:id])
    #dup = duplicate!
    perguntas_before = @quiz.perguntas.dup
    respostas_before = Array.new
    
    perguntas_before.each do |pergunta|
      pergunta.respostas.each do |resposta|
        respostas_before.push(resposta)
      end
    end
    
    respond_to do |format|
      if (@quiz.update_attributes(params[:quiz]))
        
        perguntas_after = @quiz.perguntas.dup
        respostas_after = Array.new
        
        perguntas_after.each do |pergunta|
          pergunta.respostas.each do |resposta|
            respostas_after.push(resposta)
          end
        end
        
        new_perguntas =  perguntas_after - perguntas_before
        new_respostas = respostas_after - respostas_before
        
        incrementPoints(:edit, new_perguntas.count)
        format.json { render :json => { :success => true, :quiz_id => @quiz.id, :perguntas => new_perguntas, :respostas => new_respostas }, :status => :created, :location => @quiz }

        format.html { redirect_to @quiz, :notice => 'Quiz was successfully updated.' }
      else
        render :edit
      end
    end
  end
  
  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    
    #redirect_to(action: "index")
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to quizzes_url }
    end
  end
end
