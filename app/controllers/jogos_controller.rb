class JogosController < ApplicationController
  before_filter :authenticate_user!
  # GET /jogos
  # GET /jogos.json
  def index
    @jogos = Jogo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @jogos }
    end
  end
  
  # GET /jogos/1
  # GET /jogos/1.json
  def show
    @jogo = Jogo.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      #perguntas = mountPerguntas(@jogo.perguntas)
      #format.json { render :json => { :jogo => @jogo },  :include => { :perguntas => { :include =>  :respostas } } }
    end
  end
  

  # GET /jogos/new
  # GET /jogos/new.json
  def new 
    @jogo = Jogo.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @jogo }
    end
  end
  
  # POST /jogos
  # POST /jogos.json
  def create
    @jogo = Jogo.new(params[:jogo])
    #@jogo.usuario_id = params[:usuario_id].to_i
    respond_to do |format|
      if @jogo.save
        incrementUser()
        format.json { render :json => @jogo, :status => :created, :location => @jogo }
        format.html { redirect_to @jogo, :notice => 'Jogo was successfully created.' }
      else
       # render action: "new"
       format.html { render :new }
       format.json { render :json => @jogo.errors, :status => :unprocessable_entity }
      end
    end
  end
  def incrementUser
    user= @jogo.user
    if user.scoreplayer == nil then
      user.scoreplayer = 0 + @jogo.pontos
    else
      user.scoreplayer = user.scoreplayer + @jogo.pontos
    end
    user.save
  end
  # GET /jogos/1/edit
  def edit
    @jogo = Jogo.find(params[:id]) 
  end
  
  # PUT /jogos/1
  # PUT /jogos/1.json
  def update
    @jogo = Jogo.find(params[:id])
    
    respond_to do |format|
      if (@jogo.update_attributes(params[:jogo]))
        
       # format.json { render :json => { :success => true, :jogo_id => @jogo.id, :perguntas => new_perguntas, :respostas => new_respostas }, :status => :created, :location => @jogo }

        format.html { redirect_to @jogo, :notice => 'Jogo was successfully updated.' }
      else
        render :edit
      end
    end
  end
  
  # DELETE /jogos/1
  # DELETE /jogos/1.json
  def destroy
    @jogo = Jogo.find(params[:id])
    @jogo.destroy
    
    #redirect_to(action: "index")
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to jogos_url }
    end
  end
end
