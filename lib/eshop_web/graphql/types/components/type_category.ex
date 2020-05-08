defmodule EshopWeb.Schema.Types.TypeCategory do
  use Absinthe.Schema.Notation
  
  object "type_category" do
    field :id, :integer
    field :type, :integer
    field :type_id, :integer
    field :category_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
