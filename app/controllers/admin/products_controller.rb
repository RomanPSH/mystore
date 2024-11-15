class Admin::ProductsController < Admin::AdminController

  before_action :set_product, only: [:edit, :update, :destroy]
  

  def new
    @product = Product.new
  end  

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, success: 'Продукт успішно створено'
    else
      render :new, danger: 'Не вдалося створити продукт'
    end
  end

  def edit

  end

  def update

    if @product.update(product_params)
      redirect_to @product, success: 'Продукт успішно оновлено'
    else
      render :edit, danger: 'Не вдалося оновити продукт'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, success: 'Продукт успішно видалено'
  end
  


  private 
  
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :brand, :product_type, :engine_type, :color, :cost, :image)
  end
end
