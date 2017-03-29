class PairingsController < ApplicationController

  def index
    @offered_pairings = Pairing.where(mentee_id: nil).order(start_time: :asc)
  end

  def show
  end

  def new
  end

  def update #post
  end

  def edit #get
  end

  def create
  end

  private
  def pairing_params
    params.require(:pairing).permit(:mentor_id, :start_time)
  end

end
