class SellersController < ApplicationController
  def new
    @seller = Seller.new
    @item = Item.new
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
     respond_to do |format|
      if @seller.update_attributes(params[:seller])
        format.html { redirect_to @seller, notice: 'Seller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @seller = Seller.new(params[:seller][:name])
    @item = Item.create(:name => params[:item_name], :seller_id => @seller.id)
    @seller << @item

    respond_to do |format|
      if @seller.save
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
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
