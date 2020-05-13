defmodule EshopWeb.Schema.Types.TypeStatus do
  use Absinthe.Schema.Notation
  
  object :package_item do
    field :id, :integer
    field :is_active, :boolean
    field :order, :integer
    field :type, :integer
    field :name, :string
    field :native_name, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
