class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:product).all
  end

  def new
    @recipe = Recipe.new
    @ingredients = [RecipeIngredient.new]
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipes_path
    else
      @ingredients = @recipe.ingredients
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def prepare
    @recipe = Recipe.includes(:product, ingredients: [:stock, :unit]).find(params[:id])
    @production = Production.new(date: Date.today)
    @ingredients = @recipe.ingredients.map { |i| parse_ingredient(i) }
    p @recipe.ingredients
    p @ingredients
  end

  def save_prepare
    @production = Production.new(production_params)
    if @production.save
      redirect_to products_path
    else
      @recipe = Recipe.find_by(product_id: @production.product_id)
      render "prepare"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:product_id, :name, :expected_quantity, ingredients_attributes: {})
  end

  def production_params
    params.require(:production).permit(:date, :quantity, :product_id, stocks_attributes: {})
  end

  def parse_ingredient(ingredient)
    ProductionStock.new({
      stock_id: ingredient.stock_id,
      quantity: ingredient.quantity,
      unit_id: ingredient.unit_id
    })
  end
end
