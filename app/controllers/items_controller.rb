class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item= Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
else
  render :new
end
end

before_action :set_item, except: [:index, :new, :create]
def update
  if @item.update(item_params)
    redirect_to root_path
  else 
    render:edit
  end
end


private
def item_params
  params.require(:item).permit(:name, :explanation, :price, :condition_id, :payer_id, :preparation_day_id, :prefecture_id, images_attributes: [:url, :_destroy, :id])
end


def set_item
  @item =Item.find(params[:id])
end

def edit
end
  
def destroy
end


def show
end


end


# includes(:images).order('created_at DESC')