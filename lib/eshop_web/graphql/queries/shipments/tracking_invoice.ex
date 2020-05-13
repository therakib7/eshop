defmodule EshopWeb.Schema.Queries.TrackingInvoice do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TrackingInvoice, as: TrackingInvoice

  object :tracking_invoice_queries do
    @desc "Get all tracking_invoices"
    field :tracking_invoices, list_of(:tracking_invoice) do
      resolve &TrackingInvoice.list_tracking_invoices/3
    end

    @desc "Get a tracking_invoice by its id"
    field :tracking_invoice, :tracking_invoice do
      arg :id, non_null(:id)
      resolve &TrackingInvoice.get_tracking_invoice/3
    end 
  end
end