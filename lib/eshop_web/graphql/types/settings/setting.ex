defmodule EshopWeb.Schema.Types.Setting do
  use Absinthe.Schema.Notation
  
  object :setting do
    field :id, :integer
    field :key, :string
    field :value, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
