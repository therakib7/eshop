defmodule EshopWeb.Schema.Types.Guarantee do
  use Absinthe.Schema.Notation
  
  object :guarantee do
    field :id, :integer
    field :content, :string
    field :duration, :integer
    field :gurantee_type, :integer
    field :native_content, :string
    field :item_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
