class SearchController < ApplicationController
  def unifiedSearch
    results = []

    if (params[:types].nil? == false)
      if (params[:types].include?('food'))
        foods = Food.search params[:value], :star => true

        foods.each do |food|
          results.push({:text => food[:name], :type => 'food'})
        end
      end

      if (params[:types].include?('company'))
        companies = Company.search params[:value], :star => true

        companies.each do |company|
          results.push({:text => company[:name], :type => 'company'})
        end
      end

      if (params[:types].include?('food-group'))
        food_groups = FoodGroup.search params[:value], :star => true

        food_groups.each do |food_group|
          results.push({:text => food_group[:name], :value => food_group.id, :type => 'food-group'})
        end
      end

      results.sort! { |a,b| a[:text].downcase <=> b[:text].downcase }
    end

    render :json => results
  end
end
