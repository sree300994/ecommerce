class DashboardController < ApplicationController
  def home
  end

  def categories
    @categories = Category.all
  end

  def products
  end

  def users
    @users = User.all
  end

  def reviews
  end

  def orders
    @orders = Order.all
  end
end
