defmodule EshopWeb.Schema.Types.Package do
  use Absinthe.Schema.Notation
  
  object :package do
    field :id, :integer
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end