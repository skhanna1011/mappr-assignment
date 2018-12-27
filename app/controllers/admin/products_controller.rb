class Admin::ProductsController < ApplicationController

  before_action :set_product, only:[:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    if @product.update_attributes(update_params)
      redirect_to edit_admin_product_path, notice: 'Product was successfully updated.'
    else
      redirect_to edit_admin_product_path, notice: 'Product was not updated'
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path, notice: 'Product was successfully deleted.'
    else
      redirect_to edit_admin_product_path, notice: 'Product was not deleted'
    end
  end

  private

  def set_product
    begin
      @product = Product.find(params[:id])
    rescue
      redirect_to admin_products_path, notice: "Record not found"
    end
  end

  def update_params
    uparams =  product_params.slice(:expire_date, :name, :sku_id, :price)
    categories = product_params[:categories]
    categories = categories.split(',').map(&:strip) if categories.is_a?(String)
    tags = product_params[:tags]
    tags = tags.split(',').map(&:strip) if tags.is_a?(String)

    uparams.merge!({
      categories: categories.to_json,
      tags: tags.to_json
    })
  end

  def product_params
    params[:product].permit(:expire_date, :name, :sku_id, :price, :categories, :tags)
  end

end
