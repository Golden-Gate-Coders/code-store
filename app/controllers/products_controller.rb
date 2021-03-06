class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  before_action :authenticate_admin!, except: [:index, :show, :search]

  # RESTful routes
  def index
    sort = params[:sort]
    sort_order = params[:sort_order]
    discount = params[:discount]

    # if discount
    #   @products = Product.where("price < ?", 20)
    #   if sort
    #     @products = @products.order(price: :desc)
    #   end
    # elsif sort && sort_order
    #   @products = Product.all.order(sort => sort_order)
    # else
    #   @products = Product.all
    # end

    category_id = params[:category_id]
    if category_id
      @category = Category.find_by(id: category_id)
      @products = @category.products
    else
      @products = Product.all
    end



  end

  def show
    if params[:id] == "random"
      # Select random product from the database
      products = Product.all
      @product = products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def search
    search_term = params[:search_term]
    @products = Product.where("name ILIKE ?", "%#{search_term}%")
    render :index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(
      name: params[:name], 
      description: params[:description],
      price: params[:price],
      stock: params[:stock],
      image: params[:image],
      supplier_id:params[:supplier][:supplier_id])

    if @product.save
      flash[:success] = "Product created successfully!"
      redirect_to "/products/#{@product.id}"
    else
      flash[:danger] = "Product could not be created!"
      render "new.html.erb"
    end
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.price = params[:price]
    @product.stock = params[:stock]
    @product.image = params[:image]

    if @product.save
      flash[:info] = "Product updated successfully!"
      redirect_to "/products/#{@product.id}"
    else
      flash[:danger] = "Product could not be updated!"
      render "edit.html.erb"
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    flash[:danger] = "Product destroyed successfully!"
    redirect_to "/products"
  end
end
