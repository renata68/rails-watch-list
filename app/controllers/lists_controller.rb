class ListsController < ApplicationController
  def index
  @lists = List.all
  end
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocesable_entity # souvislosti s validacemi a pozor na to tohle vysvetlit priste je to slozite
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
