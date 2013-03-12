class CheckInsController < ApplicationController
  # GET /check_ins
  # GET /check_ins.json
  def index
    @check_ins = CheckIn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @check_ins }
    end
  end

  # GET /check_ins/1
  # GET /check_ins/1.json
  def show
    @check_in = CheckIn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @check_in }
    end
  end

  # GET /check_ins/new
  # GET /check_ins/new.json
  def new
    @check_in = CheckIn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @check_in }
    end
  end

  # GET /check_ins/1/edit
  def edit
    @options = Beer.all.collect {|m| [m.title, m.id] }
    @check_in = CheckIn.find(params[:id])
  end

  # POST /check_ins
  def create
    @check_in = CheckIn.new(params[:check_in])
     if current_user
      @check_in.user_id = current_user
     end
     if @check_in.save
      redirect_to @check_in.beer, notice: 'Check-in was successfully created.'
     else
      render action: "new"
    end

    #respond_to do |format|
    #  if @check_in.save
    #    redirect_to @check_in, notice: 'Check in was successfully created.' 
    #  else
    #    render action: "new" 
    #  end
    #end
  end

  # PUT /check_ins/1
  def update
    @check_in = CheckIn.find(params[:id])
    
    
      if current_user and current_user == @check_in.user
      respond_to do |format|
        if @check_in.update_attributes(params[:check_in])
          format.html { redirect_to @check_in.beer, notice: 'Check in was successfully updated.' }
        else
          format.html {  render action: "edit" }
        end
      end
    else
      redirect_to session[:previous], :notice => "Illegal action"
    end
   
  end

  # DELETE /check_ins/1
  def destroy
    @check_in = CheckIn.find(params[:id])
    @check_in.destroy

    respond_to do |format|
       format.html { redirect_to session[:previous] }
    end
  end
end
