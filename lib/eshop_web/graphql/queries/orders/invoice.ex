defmodule EshopWeb.Schema.Queries.Invoice do 
  use Absinthe.Schema.Notation

  object :invoice_queries do
    @desc "Get all invoices"
    field :invoices, list_of(:invoice) do
      resolve &EshopWeb.Schema.Resolvers.Invoice.list_invoices/3
    end
  end 
end
