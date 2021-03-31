class StocksController < ApplicationController
  def index
    @stocks = Stock.includes(:unit).where(relevant: true)
  end
end
