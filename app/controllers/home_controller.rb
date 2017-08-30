class HomeController < ApplicationController
  def index
  	@categories = Category.order('name DESC')
  end

  def about
  end

  def contact
  end
end
