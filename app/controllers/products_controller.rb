class ProductsController < ApplicationController
before_action :set_product,  only: %i[ show edit update destroy ]
skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    if params[:localisation_sort]
      @products=Product.all.orderByLocalisation.kaminari(params[:page])
      elsif params[:availability_sort]
        @products=Product.all.orderByAvailability.kaminari(params[:page])
      elsif params[:cost_sort]
          @products=Product.all.orderByCost.kaminari(params[:page])
    else
      @products=Product.all.ordered.kaminari(params[:page])
   end
end
  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save

        format.html { redirect_to product_url(@product), notice: "Votre produit est créé avec succès." }

        format.json { render :show, availability: :created, location: @product }
      else
        format.html { render :new, availability: :unprocessable_entity }
        format.json { render json: @product.errors, availability: :unprocessable_entity }
      end
    end
  end

  def search
      session[:search] = {'title' => params[:search_title], 'availability' => params[:search_availability], 'localisation' => params[:search_localisation],'cost'=>params[:search_cost]}
      @products = researched.ordered
      @search_title = session[:search]['title']
      render :index
    end

    def sort
      @products = researched.ordered
      @search_title = session[:search]['title']  if session[:search].present?
      session[:search] = nil
      render :index
    end

    def researched
        if session[:search].present?
          if session[:search]['title'].blank? && session[:search]['availability'].blank? && session[:search]['localisation'].blank? && session[:search]['cost'].blank?
            Product.all.kaminari(params[:page])

            # The title has been entered
          #elsif session[:search]['title'].present?
          else
            products = Product.all
            # If availability, localisation were specified
            if session[:search]['title'].present?
              products = products.title_sort(session[:search]['title']).kaminari(params[:page])#ajoout
              # If only localisation and title is specified
            end

            if session[:search]['availability'].present?
              products = products.availability_sort(session[:search]['availability']).kaminari(params[:page])
              # If only localisation and title is specified
            end

            if session[:search]['localisation'].present?
              products = products.localisation_sort(session[:search]['localisation']).kaminari(params[:page])
              # If only localisation and title is specified
            end

            if session[:search]['cost'].present?
              products = products.cost_sort(session[:search]['cost']).kaminari(params[:page])
              # If only localisation and title is specified
            end
            products.kaminari(params[:page])
          end
        end
      end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Le produit a été mis à jour avec succès." }
        format.json { render :show, availability: :ok, location: @product }
      else
        format.html { render :edit, availability: :unprocessable_entity }
        format.json { render json: @product.errors, availability: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Le produit a été détruit avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :localisation, :availability, :remarks, :cost, :image, :image_cache)
    end
end
