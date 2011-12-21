class FoodsController < ApplicationController
  # GET /foods
  def index
    logger.info params.inspect

    conditions = {}
    if params[:name] && params[:name] != ''
      conditions[:name] = params[:name]
    end

    if params[:company_name] && params[:company_name] != ''
      conditions[:company_name] = params[:company_name]
    end

    if params[:food_group_name] && params[:food_group_name] != ''
      conditions[:food_group_name] = params[:food_group_name]
    end

    if params[:food_group_id]
      conditions[:food_group_id] = params[:food_group_id].join(' | ')
    end

    search = ''
    if params[:all]
      search = params[:all]
    end

    if conditions.length > 0 && search != ''
      foods = Food.search search, :conditions => conditions, :star => true
    elsif conditions.length == 0 && search != ''
      foods = Food.search search, :star => true
    elsif conditions.length > 0 && search == ''
      foods = Food.search :conditions => conditions, :star => true
    else
      foods = []
    end

    render :json => foods.to_json( :include => [ :products, :nutrients, :company ] )
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

    params[:food].delete('id')

    if @food.update_attributes(params[:food])
      render :json => @food
    else
      render :json => @food.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    render :json => []
  end
end
