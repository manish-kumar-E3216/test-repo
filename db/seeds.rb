#sample record creation
count = 6
count.times do |item|
  Restaurant.create(name: "a" * item)
end


count = 6
count.times do |item|
  Foodcategory.create(name: "Category" + (item+1).to_s, description: "asdad")
end

count = 6*5
categorycount = 1
max_check = 5

count.times do |item|
  if item == max_check
    categorycount = categorycount + 1
    max_check = max_check + 5
  end
  Food.create(foodcategory_id: categorycount, name: "food" + (item+1).to_s, description: "asddf")
  rcount = 6
  rcount.times do |res|
    Foodlist.create(restaurant_id: res+1, food_id: item+1, cityinfo_id: "asdasd", foodcost: 2*item, foodcategory_id: categorycount)
  end
end

count = 5*11
restaurantcount = 1
categorycount = 1
count.times do |item|
  if restaurantcount == 6
    restaurantcount = 1
  end
  if categorycount == 12
    restaurantcount = restaurantcount + 1
    categorycount = 1
  end
  FoodCategoryList.create(restaurant_id: restaurantcount, foodcategory_id:categorycount)
  categorycount = categorycount + 1
end

