class ShoesController < ApplicationController
  def index
    @shoes = Shoe.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def new
    @shoe = Shoe.new
    shoes_and_sizes()
  end

  def create
    @shoe = Shoe.new(shoe_attributes)

    if @shoe.valid?
      @shoe.save
      redirect_to "/shoes", notice: "Shoe created successfully"
    else
      render "new"
    end
  end

  def show
    @shoe = Shoe.find(params.fetch(:id))
  end

  def edit
    @shoe = Shoe.find(params.fetch(:id))
    shoes_and_sizes()
  end

  def update
    @shoe = Shoe.find(params.fetch(:id))

    if @shoe.update(shoe_attributes)
      redirect_to @shoe, notice: "Movie updated successfully"
    else
      render "edit"
    end
  end

  def destroy
    #@shoe = Shoe.find(params.fetch(:id))

    #@shoe.destroy

    the_id = params.fetch(:id)
    shoe = Shoe.where({ :id => the_id }).first

    shoe.delete

    redirect_to shoes_url, notice: "Shoe deleted successfully"
    #redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end

  def liked_shoes

    render "shoes/liked_shoes.html.erb"
  end

  private 

  def shoes_and_sizes
    @sizes = []
    @shoe_types = ['Mens', 'Womens', 'Big Kids', 'Little Kids', 'Toddlers']

    (1..18).each do |count| 
      @sizes.push(count.to_s)
    end 
  end

  def shoe_attributes
    shoe_attributes = params.require(:shoe).permit(:owner_id, :image, :title, :description, :deadstock, :authentic)
  end
end
