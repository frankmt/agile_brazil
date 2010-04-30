class SessionsStateController < ApplicationController
  def show
  end
  
  def update
    if @session.update_attributes(params[:session])
      flash[:notice] = @session.accepted? ? t('flash.session.confirm.success') : t('flash.session.withdraw.success')
      redirect_to user_my_sessions_path(current_user)
    else
      flash.now[:error] = t('flash.failure')
      render :show
    end
  end
  
  protected
  def authorize_action
    @session = Session.find(params[:session_id])
    unauthorized! unless @session.try(:is_author?, current_user) && @session.pending_confirmation? && @session.review_decision
  end
end