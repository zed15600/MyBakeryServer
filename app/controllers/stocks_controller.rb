class StocksController < ApplicationController
  def index
    @stocks = Stock.includes(:unit).all
  end
end
