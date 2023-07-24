# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def favorites
    redirect_to root_url, alert: "Vous n'avez pas les droits" if current_user.id != params[:id].to_i
  end

  def expert
    redirect_to root_url, alert: "Vous n'avez pas les droits" if current_user.role != "expert"
    user_notes_wine_ids = Note.where(user_id: current_user.id).pluck(:wine_id)
    @all_wines_not_reviewed_by_user = Wine.where.not(id: user_notes_wine_ids)
  end

  def admin
    redirect_to root_url, alert: "Vous n'avez pas les droits" if current_user.role != "admin"
    @experts = User.where(role: :expert)
    @admins = User.where(role: :admin).where.not(id: current_user.id)
    @users = User.where(role: :user)
  end

  def impersonate
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_inpersonate
    stop_impersonating_user
    redirect_to root_path
  end

  def change_role_user()
    current_user.update(role: params[:role].to_sym)
    redirect_to root_url, notice: "Vous êtes maintenant un #{params[:role] == "expert" ? "expert" : "utilisateur"} !"
  end
end
