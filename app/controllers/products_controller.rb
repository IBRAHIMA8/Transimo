class ProductsController < ApplicationController
before_action :authenticate_user!
before_action :set_product,  only: %i[ show edit update destroy ]
  # GET /products or /products.json
  def index
   #@products = Product.all.order(id: "desc")

    if params[:localisation_sort]
      @products=Product.all.orderByLocalisation.kaminari(params[:page])
    else
      @products=Product.all.ordered.kaminari(params[:page])
   end
  # @user=current_user
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
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
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
            Product.current_user_sort(current_user.id).kaminari(params[:page])

            # The title has been entered
          elsif session[:search]['title'].present?
            # If availability, localisation were specified
            if session[:search]['availability'].present? && session[:search]['localisation'].present? && session[:search]['cost'].present?
              Product.current_user_sort(current_user.id).search_sort(session[:search]['title']).availability_sort(session[:search]['availability']).localisation_sort(session[:search]['localisation']).cost_sort(session[:cost]['availability']).kaminari(params[:page])
              # If only localisation and title is specified
            elsif session[:search]['availability'].present? && session[:search]['localisation'].present?
              Product.current_user_sort(current_user.id).search_sort(session[:search]['title']).availability_sort(session[:search]['availability'])..cost_sort(session[:search]['cost']).kaminari(params[:page])
              #If only localisation and title are specified
            elsif session[:search]['localisation'].present?
              Product.current_user_sort(current_user.id).search_sort(session[:search]['title']).availability_sort(session[:search]['localisation']).kaminari(params[:page])
            elsif session[:search]['cost'].present?
              Product.current_user_sort(current_user.id).title_sort(session[:search]['title']).cost_sort(session[:search]['cost']).kaminari(params[:page])
            else
              Product.current_user_sort(current_user.id).search_sort(session[:search]['title']).kaminari(params[:page])
            end


            # The title is empty and the availability is specified
          elsif session[:search]['availability'].present?
            # If localisation and availability are specified
            if session[:search]['cost'].present? && session[:search]['localisation'].present?
              Product.current_user_sort(current_user.id).availability_sort(session[:search]['availability']).localisation_sort(session[:search]['localisation']).cost_sort(session[:search]['cost']).kaminari(params[:page])
              # If only localisation is specified
            elsif session[:search]['localisation'].present?
              Product.current_user_sort(current_user.id).localisation_sort(session[:search]['localisation']).availability_sort(session[:search]['availability']).kaminari(params[:page])
            elsif session[:search]['cost'].present?
              Product.current_user_sort(current_user.id).cost_sort(session[:search]['cost']).availability_sort(session[:search]['availability']).kaminari(params[:page])
            else
              Product.current_user_sort(current_user.id).availability_sort(session[:search]['availability']).kaminari(params[:page])
            end

            #-------------------------
          elsif session[:search]['localisation'].present?
            # If localisation and availability are specified
            if session[:search]['cost'].present?
              Product.current_user_sort(current_user.id).cost_sort(session[:search]['cost']).localisation_sort(session[:search]['localisation']).kaminari(params[:page])
              # If only localisation is specified
            else
              Product.current_user_sort(current_user.id).localisation_sort(session[:search]['localisation']).kaminari(params[:page])
            end


          elsif session[:search]['cost'].present?
            Product.current_user_sort(current_user.id).cost_sort(session[:search]['cost']).kaminari(params[:page])


          else
            Product.current_user_sort(current_user.id).kaminari(params[:page])
          end
        end
      end


  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
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
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
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
