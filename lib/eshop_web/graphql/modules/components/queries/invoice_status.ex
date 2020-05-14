defmodule EshopWeb.Schema.Queries.InvoiceStatus do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.InvoiceStatus, as: InvoiceStatus

  object :invoice_status_queries do
      @desc "Get all invoice_statuses"
      field :invoice_statuses, list_of(:invoice_status) do
          resolve &InvoiceStatus.list_invoice_statuses/3
      end

      @desc "Get a invoice_status by its id"
      field :invoice_status, :invoice_status do
          arg :id, non_null(:id)
          resolve &InvoiceStatus.get_invoice_status/3
      end 
  end
end
