require 'faker'
10.times do
	category = Category.new({"name" => Faker::Commerce.department(1)})
	category.save
end

100.times do
	product = Product.new({"name" => Faker::Commerce.product_name, "price" => Faker::Commerce.price(10..1000), "description" => Faker::Lorem.sentence, "category_id" => Category.all.sample.id})
	product.save
end

# 200.times do
	# review = Review.new({"produt_id" => Product.all.sample.id, "user_id" => User.all.sample.id, "body" => Faker::Lorem.sentence})
	# review.save
# end