class FavoritesController < ApplicationController
    def index
        @favorites = current_user.favorites
    end

    def create
        current_user.favorites.create(wine: Wine.find(params[:wine]))
        redirect_to wine_url(params[:wine]), notice: "Ajouté aux favoris"
    end

    def destroy
        wine_favorite = current_user.favorites.find_by(wine_id: Wine.find(params[:id]))
        wine_favorite.destroy
        redirect_to wine_url(params[:id]), alert: "Supprimé des favoris"
    end
end
