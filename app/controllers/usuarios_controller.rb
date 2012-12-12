class UsuariosController < ApplicationController
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuarios }
    end
  end
  
  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      #perguntas = mountPerguntas(@usuario.perguntas)
      #format.json { render :json => { :usuario => @usuario },  :include => { :perguntas => { :include =>  :respostas } } }
    end
  end
  

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new 
    @usuario = Usuario.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuario }
    end
  end
  
  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])
    respond_to do |format|
      if @usuario.save
        format.json { render :json => @usuario, :status => :created, :location => @usuario }
        format.html { redirect_to @usuario, :notice => 'Usuario was successfully created.' }
      else
       # render action: "new"
       format.html { render :new }
       format.json { render :json => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id]) 
  end
  
  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
    
    respond_to do |format|
      if (@usuario.update_attributes(params[:usuario]))
        
       # format.json { render :json => { :success => true, :usuario_id => @usuario.id, :perguntas => new_perguntas, :respostas => new_respostas }, :status => :created, :location => @usuario }

        format.html { redirect_to @usuario, :notice => 'Usuario was successfully updated.' }
      else
        render :edit
      end
    end
  end
  
  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    
    #redirect_to(action: "index")
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to usuarios_url }
    end
  end
end
