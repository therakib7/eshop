defmodule EshopWeb.Schema.Types.Category do
  use Absinthe.Schema.Notation
  
  object :category do
    field :id, :integer
    field :is_active, :boolean
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :parent_id, :id
    field :attachment_id, :id
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
