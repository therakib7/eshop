defmodule EshopWeb.Schema.Queries.Invoice do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Invoice, as: Invoice

  object :invoice_queries do
    @desc "Get all invoices"
    field :invoices, list_of(:invoice) do
      resolve(&Invoice.list_invoices/3)
    end

    @desc "Get a invoice by its id"
    field :invoice, :invoice do
      arg(:id, non_null(:id))
      resolve(&Invoice.get_invoice/3)
    end
  end
end
