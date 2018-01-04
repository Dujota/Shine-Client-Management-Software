class CustomersController < ApplicationController
  PAGE_SIZE = 10

  def index
    # pagination via Bootstrap
    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = CustomerSearchTerm.new(@keywords)
      @customers = Customer.where(
        customer_search_term.where_clause,
        customer_search_term.where_args).
        order(customer_search_term.order)
    else
      @customers = []
    end

    respond_to do |format|
      format.html
      format.json { render json: {customers: @customers } }
    end
    # @customers = Customer.all.limit(10)
  end

end
