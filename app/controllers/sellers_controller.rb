class SellersController < ApplicationController
  def new
    @seller = Seller.new
    @item = Item.new
  end

  def index
    @sellers = Seller.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seller }
    end
  end

  def show
    @seller = Seller.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seller }
    end
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def update
    @seller = Seller.find(params[:id])
    @item = Item.create(:name => params[:item_name], :seller_id => @seller.id)

     respond_to do |format|
      if @seller.items << @item
        format.html { redirect_to @seller, notice: 'Successfully added.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @seller = Seller.find_or_create_by_name(params[:seller])

    respond_to do |format|
      if true 
        @item = Item.create(:name => params[:item_name], :seller_id => @seller.id)
        @seller.items << @item
        format.html { redirect_to @seller, notice: 'Seller was successfully created.' }
        format.json { render json: @seller, status: :created, location: @seller }
      else
        format.html { render action: "new" }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy

    respond_to do |format|
      format.html { redirect_to sellers_url }
      format.json { head :no_content }
    end
  end
end
