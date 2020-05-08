defmodule EshopWeb.Schema.Queries.TrackingInvoice do 
  use Absinthe.Schema.Notation

  object :tracking_invoice_queries do
    @desc "Get all tracking_invoices"
    field :tracking_invoices, list_of(:tracking_invoice) do
      resolve &EshopWeb.Schema.Resolvers.TrackingInvoice.list_tracking_invoices/3
    end
  end 
end
