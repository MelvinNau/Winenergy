class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]

  # GET /wines or /wines.json
  def index
    @wines = Wine.all
  end

  # GET /wines/1 or /wines/1.json
  def show
    if !user_signed_in?
      redirect_to root_url, alert: "Veuillez vous connecter" 
      return
    end
    @add_to_favorites = current_user.favorites.where(wine_id: params[:id]).count >= 1 ? params[:id] : nil
    @add_to_alerts = current_user.alerts.where(wine_id: params[:id]).count >= 1 ? params[:id] : nil

    @chart_data = {
      labels: @wine.prices.map { |price| I18n.l(price.date, format: '%B %y') }.reverse,
      datasets: [{
        label: 'Données sur 12 mois',
        backgroundColor: 'transparent',
        borderColor: '#3B82F6',
        data: @wine.prices.map { |price| price.price }.reverse,
      }]
    }

    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines or /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to wine_url(@wine), notice: "Wine was successfully created." }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to wine_url(@wine), notice: "Wine was successfully updated." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to wines_url, notice: "Wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def autocomplete
    query = params[:q]
    @search_result = Wine.where(
      "LOWER(name) LIKE :query OR LOWER(domain) LIKE :query OR LOWER(variety) LIKE :query",
      query: "%#{query}%"
    )    
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name, :domain, :label, :variety, :designation, :alcohol, :years, :vendors_id, :price)
    end
end
