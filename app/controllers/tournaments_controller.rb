class TournamentsController < ApplicationController
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
    @tournament = Tournament.new(article_params)

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

    if @tournament.update(article_params)
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

  def article_params
    params.require(:tournament).permit(:title, :location, :start_date, :end_date)
  end

end
