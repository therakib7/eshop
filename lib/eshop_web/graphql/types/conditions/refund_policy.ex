defmodule EshopWeb.Schema.Types.RefundPolicy do
  use Absinthe.Schema.Notation
  
  object "refund_policy" do
    field :id, :integer
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
