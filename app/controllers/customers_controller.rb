class CustomersController < ApplicationController

  def index
    if params[:keywords].present? #try any? later to see if search still works
      @search_term = params[:keywords]
      customer_search_term = CustomerSearchTerm.new(@search_term)
      @customers = Customer.where(
        customer_search_term.where_clause,
        customer_search_term.where_args).
        order(customer_search_term.order)
    else
      @customers = []

    end
    # @customers = Customer.all.limit(10)
  end

end
