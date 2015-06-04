class StylesController < ApplicationController
  before_action :require_user, except: [:show]

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:success] = "New cuisine added."
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @style = Style.find(params[:id])
    @recipes = @style.recipes.paginate(page: params[:page], per_page: 5)
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end

end