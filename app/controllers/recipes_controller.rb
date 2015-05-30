class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order("created_at desc").all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2)
    if @recipe.save
      flash[:success] = "You have successfully added a new recipe"
      redirect_to recipe_path(@recipe)
    else
      flash.now[:danger] = "You have some errors"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was update successfully"
      redirect_to recipe_path(@recipe)
    else
      #flash.now[:warning] = "There was an error"
      render :edit
    end
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture)
  end
end