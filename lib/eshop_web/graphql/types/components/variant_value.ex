defmodule EshopWeb.Schema.Types.VariantValue do
  use Absinthe.Schema.Notation
  
  object :variant_value do
    field :id, :integer
    field :native_value, :string
    field :value, :string
    field :variant_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
