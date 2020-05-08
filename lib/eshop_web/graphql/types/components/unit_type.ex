defmodule EshopWeb.Schema.Types.UnitType do
  use Absinthe.Schema.Notation
  
  object :unit_type do
    field :id, :integer
    field :name, :string
    field :native_name, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
