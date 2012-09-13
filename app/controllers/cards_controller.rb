class CardsController < ActionController::ApplicationController
  handles_sortable_columns

  def index
    order = sortable_column_order
    @cards = Card.order(order)
    
    respond_to do |format|
      format.html
      format.json { render :json => @cards }
    end
  end
end