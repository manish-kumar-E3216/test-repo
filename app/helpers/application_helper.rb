module ApplicationHelper
  def isCartAvailable?
    OrderFoodItem.count > 0 ?  true : false
  end
end
