class NotesController < ApplicationController
    before_action :set_wine, only: [:new]

    def new
        @note = Note.new(wine_id: params[:id], user_id: current_user.id)
    end

    def create
        note = params[:note]

        user = User.find(note[:user_id])
        wine = Wine.find(note[:wine_id])
        new_note = Note.create(user_id: note[:user_id], 
                                wine_id: note[:wine_id], 
                                balance: note[:balance],
                                intensity: note[:intensity],
                                complexity: note[:complexity],
                                aroma: note[:aroma])    
        wine.notes << new_note
        redirect_to expert_url(user.id) if user.expert?
    end

    private
    def set_wine
        @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
        params.require(:note).permit(:balance, :intensity, :complexity, :aroma)
    end
end
