class HomeController < ApplicationController
    def new
        @resource = User.new 
    end

    def index
        if current_user.present?
            redirect_to expert_url(current_user.id) if current_user.expert?
            redirect_to admin_url(current_user.id) if current_user.admin?
        end 
        
        @wines_better_scores = Wine.all_with_notes.sort_by { |wine| wine.score? } 

        wine_first_prices = Price.where(id: Price.select("MIN(id)").group(:wine_id)).pluck(:wine_id, :price).to_h
        @wines_better_prices = Wine.all.sort_by { |wine| wine_first_prices[wine.id] || 0 }.take(4)
    end
end
