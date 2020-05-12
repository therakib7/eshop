defmodule EshopWeb.Schema.Types.InvoiceStatus do
  use Absinthe.Schema.Notation
  
  object :package_item do
    field :id, :integer
    field :invoice_id, :integer
    field :type, :integer
    field :type_id, :integer
    field :status_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
