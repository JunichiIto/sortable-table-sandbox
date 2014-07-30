class FruitsController < ApplicationController
  before_action :set_fruit, only: [:show]

  # GET /fruits
  # GET /fruits.json
  def index
    @fruits = Fruit.rank(:row_order)
  end

  # GET /fruits/1
  # GET /fruits/1.json
  def show
  end

  # this action will be called via ajax
  def sort
    fruit = Fruit.find(params[:fruit_id])
    fruit.update(fruit_params)
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fruit
      @fruit = Fruit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fruit_params
      params.require(:fruit).permit(:row_order_position)
    end
end
