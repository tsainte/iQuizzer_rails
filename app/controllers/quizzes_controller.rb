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
      format.json { render :json => { :quiz => @quiz, :perguntas => @quiz.perguntas } } 
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
        format.json { render :json => @quiz, :status => :created, :location => @quiz }
        format.html { redirect_to @quiz, :notice => 'Quiz was successfully created.' }
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
    #dup = duplicate!
    perguntas_before = @quiz.perguntas.dup
    respostas_before = Array.new
    
    perguntas_before.each do |pergunta|
      pergunta.respostas.each do |resposta|
        respostas_before.push(resposta)
        puts "respostaaa " << resposta.to_json
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
        
        format.json { render :json => { :success => true, :quiz_id => @quiz.id, :perguntas => new_perguntas, :respostas => new_respostas }, :status => :created, :location => @quiz }

        #redirect_to(action: "show", id: @quiz)
        #redirect_to @quiz, notice: "Sucesso!" --erro pode ser aqui
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
