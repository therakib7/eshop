defmodule EshopWeb.Schema.Types.InvoiceStatus do
  use Absinthe.Schema.Notation

  @desc "A invoice_status"
  object :invoice_status do
    field :id, :integer
    field :invoice_id, :integer
    field :type, :integer
    field :type_id, :integer
    field :status_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A invoice_status update"
  input_object :invoice_status_params do 
    field :invoice_id, :integer
    field :type, :integer
    field :type_id, :integer
    field :status_id, :integer
  end
end