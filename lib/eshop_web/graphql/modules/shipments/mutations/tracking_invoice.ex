defmodule EshopWeb.Schema.Mutations.TrackingInvoice do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TrackingInvoice, as: TrackingInvoice

  object :tracking_invoice_mutations do
    @desc "Create a tracking_invoice"
    field :create_tracking_invoice, type: :tracking_invoice do
      arg(:id, :integer)
      arg(:tracking_id, :string)
      arg(:invoice_id, :integer)
      arg(:shipping_method_id, :integer)

      resolve(&TrackingInvoice.create_tracking_invoice/3)
    end

    @desc "Update a tracking_invoice"
    field :update_tracking_invoice, type: :tracking_invoice do
      arg(:id, non_null(:id))
      arg(:tracking_invoice_params, :tracking_invoice_params)

      resolve(&TrackingInvoice.update_tracking_invoice/2)
    end

    @desc "Delete a tracking_invoice"
    field :delete_tracking_invoice, type: :tracking_invoice do
      arg(:id, non_null(:id))
      resolve(&TrackingInvoice.delete_tracking_invoice/2)
    end
  end
end
