class ExpendituresController < ApplicationController

  def index
		@expenditures = Expenditure.order(date: :desc).all
		respond_to do |format|
			format.json {
				render json: {results: @expenditures}
			}
			format.html
		end
  end

  def show
		@expenditure = Expenditure.find(params[:id])
		respond_to do |format|
			format.json {
				response = @expenditure.to_json
				response.insert(response.length-1, ",\"feedstocks\":")
				response.insert(response.length-1, @expenditure.expenditures_feedstocks.to_json)
				render json: response		
			}
			format.html
		end
  end

  def new
		@expenditure = Expenditure.new
  end

  def edit
		@expenditure = Expenditure.find(params[:id])
  end

  def create
    pars = exp_params
    @expenditure = Expenditure.new
    @expenditure.date = pars[:date]
    @expenditure.total_value = pars[:total_value]
    for i in 0..pars[:feedstock_ids].length-1 do
      add_feedstock(@expenditure, pars, i)
    end
		if @expenditure.save
			respond_to do |format|
				format.json {
					render json: @expenditure
				}
				format.html {
					redirect_to @expenditure
				}
			end
		else
			respond_to do |format|
				format.json {
					render json: {error: "something went wrong with the request."}, status: 400
				}
				format.html {
					render :action => 'new', :locals => {:@exp2 => feeds}
				}
			end
		end
  end

  def update
    pars = exp_params
    @expenditure = Expenditure.find(params[:id])
    @expenditure.date = pars[:date]
    @expenditure.total_value = pars[:total_value]
    @expenditure.expenditures_feedstocks.each do |feed|
    feed_id = feed.feedstock_id
      respond_to do |format|
				format.json {
					feeds_ids = pars[:feedstocks].collect {|f| f["feedstock_id"]}
					if feeds_ids.include?(feed_id)
						i = feeds_ids.index(feed_id)
						feed.ammount = pars[:feedstocks][i]["ammount"]
						feed.price = pars[:feedstocks][i]["price"]
						pars[:feedstocks].delete_at(i)
					else
						@expenditure.expenditures_feedstocks.delete(feed)
					end
				}
				format.html {
					if pars[:feedstock_ids].include?(feed_id)
						i = pars[:feedstock_ids].index(feed_id)
						feed.ammount = pars[:ammounts][i]
						feed.price = pars[:prices][i]
						pars[:feedstock_ids].delete_at(i)
						pars[:ammounts].delete_at(i)
						pars[:prices].delete_at(i)
					else
						@expenditure.expenditures_feedstocks.delete(feed)
					end
				}
			end
		end 
		feeds = []
		for i in 0..pars[:feedstock_ids].length-1 do
			feed = add_feedstock(@expenditure, pars, i)
			feeds.append(feed)
		end
		if @expenditure.save
			respond_to do |format|
				format.json
				format.html {
					redirect_to @expenditure
				}
			end
		else
			feeds.each do |feed|
				@expenditure.expenditures_feedstocks.delete(feed)
			end
			respond_to do |format|
				format.json {
					render json: {error: "something went wrong with the request."}, status: 400
				}
				format.html {
					render :action => 'edit', :locals => {:@exp2 => feeds}
				}
			end
		end
  end


  private

  def exp_params
    params.require(:expenditure).permit(:date, :total_value, :feedstock_ids => [], :ammounts => [], :prices => [], :feedstocks => [:feedstock_id, :ammount, :price])
  end

  def add_feedstock(expenditure, pars, i)
    expFeed = ExpendituresFeedstock.new
    respond_to do |format|
      format.json {
        expFeed = ExpendituresFeedstock.new(pars[:feedstocks][i])
      }
      format.html {
      	expFeed.feedstock = Feedstock.find(pars[:feedstock_ids][i])
      	expFeed.ammount = pars[:ammounts][i]
      	expFeed.price = pars[:prices][i]
      }
    end
    expenditure.expenditures_feedstocks << expFeed
    return expFeed
  end

end
