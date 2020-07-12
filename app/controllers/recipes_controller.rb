class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = 'レシピが正常に投稿されました'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'レシピは正常に更新されました'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @recipe.destroy

    flash[:success] = 'レシピは正常に削除されました'
    redirect_to recipes_url
  end
  
  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end 

  def recipes_params
    params.require(:recipe).permit(:title)
  end
end
