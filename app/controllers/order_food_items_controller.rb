class OrderFoodItemsController < ApplicationController
  def create
    chosen_product = Food.find(params[:food_id])
    chosen_product_foodlist = Foodlist.find_by(:food_id=>params[:food_id], :restaurant_id=>params[:restaurant_id])
    price = chosen_product_foodlist.foodcost
    current_cart = @current_cart
    if current_cart.foods.include?(chosen_product)
      @order_food_item = current_cart.order_food_items.find_by(:food_id => chosen_product)
      @order_food_item.quantity += 1
    else
      @order_food_item = OrderFoodItem.new
      @order_food_item.cart = current_cart
      @order_food_item.food = chosen_product
      @order_food_item.price = price
      @order_food_item.quantity = 1
    end
    @order_food_item.save
    redirect_to cart_path(current_cart)
  end

  # # def show
  # #   render :text=>temp.inspect
  # # end
  # def new
  #   respond_to do |format|
  #     format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
  #     format.js
  #   end
  #   #respond_modal_with "val", location: order_food_items_new_path
  # end

  def add_quantity
    @order_food_item = OrderFoodItem.find(params[:id])
    @order_food_item.quantity += 1
    @order_food_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @order_food_item = OrderFoodItem.find(params[:id])
    if @order_food_item.quantity > 1
      @order_food_item.quantity -= 1
    end
    @order_food_item.save
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @order_food_item = OrderFoodItem.find(params[:id])
    @order_food_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private
  def order_food_items_params
    params.require(:order_food_item).permit(:quantity,:food_id, :cart_id, :price)
  end

end
