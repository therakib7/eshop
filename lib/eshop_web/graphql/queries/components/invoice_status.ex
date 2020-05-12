defmodule EshopWeb.Schema.Queries.InvoiceStatus do 
  use Absinthe.Schema.Notation

  object :invoice_status_queries do
    @desc "Get all invoice_statuses"
    field :invoice_statuses, list_of(:invoice_status) do
      resolve &EshopWeb.Schema.Resolvers.InvoiceStatus.list_invoice_statuses/3
    end
  end 
end
