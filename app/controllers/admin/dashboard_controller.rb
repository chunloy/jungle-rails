class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'].to_str, password: ENV['ADMIN_PASSWORD'].to_str
  def show
    @products = Product.all.length
    @categories = Category.all.length
    @line_items = LineItem.all.length
    @orders = Order.all.length
  end
end
