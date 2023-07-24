class AlertsController < ApplicationController
    def index
        @alerts = current_user.alerts
    end

    def create
        wine = Wine.find(params[:wine])
        current_user.alerts.create(wine_id: wine.id, 
                                   user_id: current_user.id, 
                                   variety: wine.variety,
                                   designation: wine.designation,
                                   domain: wine.domain)
        redirect_to wine_url(params[:wine]), notice: "Alerte activée !"
    end

    def destroy
        wine_alerts = current_user.alerts.find_by(wine_id: Wine.find(params[:id]))
        wine_alerts.destroy
        redirect_to wine_url(params[:id]), alert: "Supprimé des alertes"
    end
end
