defmodule EshopWeb.Schema.Types.Variant do
  use Absinthe.Schema.Notation
  
  object :variant do
    field :id, :integer
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :shop_id, :id
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
