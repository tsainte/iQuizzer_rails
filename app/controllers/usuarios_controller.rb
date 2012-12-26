class UsuariosController < ApplicationController
  before_filter :authenticate_user!
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuarios }
    end
  end
  
  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = User.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      #perguntas = mountPerguntas(@usuario.perguntas)
      #format.json { render :json => { :usuario => @usuario },  :include => { :perguntas => { :include =>  :respostas } } }
    end
  end
  

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new 
    @usuario = User.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuario }
    end
  end
  
  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = User.new(params[:usuario])
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
    @usuario = User.find(params[:id]) 
  end
  
  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = User.find(params[:id])
    
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
    @usuario = User.find(params[:id])
    @usuario.destroy
    
    #redirect_to(action: "index")
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to usuarios_url }
    end
  end
  
  # PUT /usuarios/validate
  # PUT /usuarios/validate
  def validate
    @usuario = User.find_by_apelido(params[:apelido])
    
    success = false
    if @usuario.senha == params[:senha] then
      success = true
    end
    respond_to do |format|
      format.json { render :json => { :success => success, :id => @usuario.id } }
     # format.html { redirect_to usuarios_url }
      format.html { render :json => { :success => success, :id => @usuario.id } }
    end
  end
end
