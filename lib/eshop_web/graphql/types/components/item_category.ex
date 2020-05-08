defmodule EshopWeb.Schema.Types.ItemCategory do
  use Absinthe.Schema.Notation
  
  object "item_category" do
    field :id, :integer
    field :item_id, :id
    field :category_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
