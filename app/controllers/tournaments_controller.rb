class TournamentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to(:controller => 'tournaments', :action => 'index')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])

    if @tournament.update(tournament_params)
      redirect_to @tournament
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy

    redirect_to(:controller => 'tournaments', :action => 'index')
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :location, :start_date, :end_date)
  end

end
