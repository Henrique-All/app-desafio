class ConsentsController < ApplicationController
  before_action :set_user
  before_action :set_purposes

  def index
    # garante que exista um registro de consentimento por finalidade
    @purposes.each do |purpose|
      @user.consents.find_or_create_by(purpose: purpose) do |c|
        c.granted = false
      end
    end
    @consents = @user.consents.order(:purpose)
  end

  def update
    @consent = @user.consents.find_by(purpose: params[:purpose])
    unless @consent
      redirect_to user_consents_path(@user), alert: 'Finalidade inválida.' and return
    end

    case params[:action_type]
    when 'grant'
      @consent.update(granted: true, granted_at: Time.current, revoked_at: nil)
      notice = "Consentimento para #{params[:purpose]} concedido."
    when 'revoke'
      @consent.update(granted: false, revoked_at: Time.current)
      notice = "Consentimento para #{params[:purpose]} revogado."
    else
      redirect_to user_consents_path(@user), alert: 'Ação inválida.' and return
    end

    redirect_to user_consents_path(@user), notice: notice
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_purposes
    @purposes = Consent::PURPOSES
  end
end