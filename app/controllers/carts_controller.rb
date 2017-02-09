class CartsController < ApplicationController
  before_action :current_cart, only: [:show, :edit, :update, :destroy]
  def create
  end

  def destroy
    logger.info "cart destroy"
    @cart.clear_cart
  end

end
