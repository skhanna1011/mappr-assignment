class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: @products    
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update_attributes(create_params)
      render json: @product, status: :created
    else
      render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def set_product
    begin
      @product = Product.find(params[:id])
    rescue
      render json: {}, status: :not_found
    end
  end

  def create_params
    cparams = product_params.slice(:expire_date, :name, :sku_id, :price)
    cparams.merge!({
      categories: product_params[:categories].to_json,
      tags: product_params[:tags].to_json,
      images: product_params[:images].to_json
    })
  end

  def product_params
    params[:product].permit(:expire_date, :name, :sku_id, :price, :categories=> [], :tags=>[], :images=>[:img_path])
  end
end
