defmodule EshopWeb.Schema.Mutations.Invoice do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Invoice, as: Invoice

  object :invoice_mutations do
    @desc "Create a invoice"
    field :create_invoice, type: :invoice do
      arg(:id, :integer)
      arg(:discount, :decimal)
      arg(:user_note, :string)
      arg(:shop_note, :string)
      arg(:paid, :decimal)
      arg(:total, :decimal)
      arg(:type, :integer)
      arg(:company_id, :id)
      arg(:shop_id, :id)
      arg(:user_id, :id)

      resolve(&Invoice.create_invoice/3)
    end

    @desc "Update a invoice"
    field :update_invoice, type: :invoice do
      arg(:id, non_null(:id))
      arg(:invoice_params, :invoice_params)

      resolve(&Invoice.update_invoice/2)
    end

    @desc "Delete a invoice"
    field :delete_invoice, type: :invoice do
      arg(:id, non_null(:id))
      resolve(&Invoice.delete_invoice/2)
    end
  end
end
