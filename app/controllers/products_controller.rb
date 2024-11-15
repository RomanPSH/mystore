class ProductsController < ApplicationController
  before_action :set_product, only: :show

  def index
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @products = Product.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", query, query).paginate(page: params[:page], per_page: 8)
    else
      @products = Product.paginate(page: params[:page], per_page: 8)
    end
  end

  def show
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end
end
