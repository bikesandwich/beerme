class BeersController < ApplicationController
  
  before_filter :check_login, :except => [:index, :search, :show]
  before_filter :save_path
  
  # GET /beers
  def index
    @beers = Beer.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /beers/1
  def show
    @beer = Beer.find(params[:id])
    @check_in = CheckIn.new

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  # SEARCH
  def search
       if params[:search_text]
         match_term = "%" + params[:search_text] + "%"
         @beers = Beer.where("title LIKE ?", match_term) + Beer.where("brewery LIKE?", match_term)
       end
  end
  
  
  # GET /beers/new
  def new
    @beer = Beer.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /beers/1/edit
  def edit
    @beer = Beer.find(params[:id])
  end

  # POST /beers
  def create
    @beer = Beer.new(params[:beer])

    respond_to do |format|
      if @beer.save
        format.html { redirect_to @beer, notice: 'Beer was successfully added.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /beers/1
  def update
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if @beer.update_attributes(params[:beer])
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        
      else
        format.html { render action: "edit" }
        
      end
    end
  end

  # DELETE /beers/1
  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    respond_to do |format|
      format.html { redirect_to beers_url }
    end
  end
end

