class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t('views.accounts.info_activation')
      redirect_to root_url
    else
      render 'new'
    end
  end

  def search
    begin
      if params[:search].empty?
        redirect_back_or root_url
      end
      @restaurants = {}
      foodcategories = Foodcategory.where(["name LIKE ?","%#{params[:search]}%"])
      if !foodcategories.empty?
        foodcategorylist = FoodCategoryList.joins(:restaurant).where(foodcategory: foodcategories).select('distinct restaurants.*')
        @restaurants = JSON.parse foodcategorylist.to_json(:only => [:id, :name])
      end
    rescue
      @restaurants = {}
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def details
    begin
      @restaurantdetails ={}
      @restaurant = Restaurant.where("id='#{params[:id]}'")
      if !@restaurant.empty?
        foodlist = Foodlist.includes(:food, :foodcategory).where(restaurant: @restaurant)
        value = foodlist.to_json(:include=>{:food => {:only => [:id, :name]}, :foodcategory => {:only=>[:id, :name]}})
        value = JSON.parse value
        @restaurantdetails ={}
        value.each do |item|
          if @restaurantdetails[item["foodcategory"]["name"]].nil?
            @restaurantdetails[item["foodcategory"]["name"]] = []
          end
          @restaurantdetails[item["foodcategory"]["name"]] << item["food"].merge({"cost": item['foodcost']})
        end
        @restaurant = JSON.parse @restaurant.to_json
      end
    rescue
      @restaurantdetails = {}
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname,:lname, :email, :password,
                                 :password_confirmation)
  end

end
