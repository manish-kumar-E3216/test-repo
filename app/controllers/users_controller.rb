class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # Handle a successful save.
      flash[:success] = "Welcome to the Happy Eats!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def search
    if params[:search].empty?
      redirect_back_or root_url
    end
    foodcategories = Foodcategory.where(["name LIKE ?","%#{params[:search]}%"])
    foodcategorylist = FoodCategoryList.joins(:restaurant).where(foodcategory: foodcategories).select('distinct restaurants.*')
    @restaurants = JSON.parse foodcategorylist.to_json(:include => { :restaurant => { :only => [:id, :name] } })
  end

  def index
    @restaurants = Restaurant.all
  end

  def details
    restaurant = Restaurant.where("id='#{params[:id]}'")
    foodlist = Foodlist.includes(:food, :foodcategory).where(restaurant: restaurant)
    begin
      value = foodlist.to_json(:include=>{:food => {:only => [:id, :name]}, :foodcategory => {:only=>[:id, :name]}})
      value = JSON.parse value
      @restaurantdetails ={}
      value.each do |item|
        if @restaurantdetails[item["foodcategory"]["name"]].nil?
          @restaurantdetails[item["foodcategory"]["name"]] = []
        end
        @restaurantdetails[item["foodcategory"]["name"]] << item["food"].merge({"cost":item["foodcost"]})
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
