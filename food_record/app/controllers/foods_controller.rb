class FoodsController < ApplicationController
  # GET /foods
  def index
    logger.info params.inspect

    conditions = {}
    if params[:name] && params[:name] != ''
      conditions[:name] = params[:name]
    end

    if params[:company] && params[:company] != ''
      conditions[:company] = params[:company]
    end

    if params[:food_group_id]
      conditions[:food_group_id] = params[:food_group_id].join(' | ')
    end

    if conditions.length > 0
      foods = Food.search :conditions => conditions, :star => true
    else
      foods = []
    end

    render :json => foods.to_json( :include => [ :products, :nutrients ] )
  end

  # GET /foods/1
  def show
    render :json => Food.find(params[:id])
  end

  # POST /foods
  def create
    @food = Food.new(params[:food])

    if @food.save
      render :json => @food, :status => :created, :location => @food 
    else
      render :json => @food.errors, :status => :unprocessable_entity
    end
  end

  # PUT /foods/1
  def update
    @food = Food.find(params[:id])

    if @food.update_attributes(params[:food])
      head :ok
    else
      render :json => @food.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    head :ok
  end
end
