class PairingsController < ApplicationController

  def index
    @offered_pairings = Pairing.where(mentee_id: nil).order(start_time: :asc)
    @pairing = Pairing.new
  end

  def show
    @pairing = Pairing.find_by(id: params[:id])
    @user = User.find_by(id: params[:mentor_id])
  end

  def new
    return redirect_to new_user_pairing_path(current_user.id) if !authorized?(params[:user_id])
    @pairing = Pairing.new
  end

  def update
    @pairing = Pairing.find_by(id: params[:id])
    @mentor = User.find_by(id: @pairing.mentor_id)
    if params[:pairing][:topic]
      update_params = add_mentee
      @pairing.update_attribute(:mentee_id, current_user.id)
    else
      update_params = pairing_params
    end

    if logged_in?
      if @pairing.update(update_params)
        redirect_to user_pairing_path
      else
        @errors = @pairing.errors.full_messages
        render 'edit'
      end
    else
      redirect_to new_session_path
    end

    if @pairing.mentee_id
      UserMailer.pairing_confirmation_email(@mentor, @pairing).deliver_now
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @pairing = Pairing.find(params[:id])
    if logged_in?
      render 'edit'
    else
      redirect_to new_session_path
    end
  end

  def create
    @user = User.find(params[:user_id])
    @pairing = @user.offerings.new(pairing_params)
    if @pairing.save
      redirect_to root_path
    else
      @errors = @pairing.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @pairing = Pairing.find(params[:id])
    if @pairing.mentor_id == session[:user_id]
      @pairing.destroy
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def reschedule
    @pairing = Pairing.find(params[:id])
  end

  def requested
    pairing = Pairing.find(params[:id])
    mentor = User.find(pairing.mentor_id)
    request = params[:request]
    UserMailer.reschedule_request_email(pairing, request, mentor).deliver_now
    redirect_to root_path
  end

  private
  def pairing_params
    params.require(:pairing).permit(:mentor_id, :start_time)
  end

  def add_mentee
    params.require(:pairing).permit(:mentee_id, :topic)
  end
end
