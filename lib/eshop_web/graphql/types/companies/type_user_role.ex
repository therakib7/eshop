defmodule EshopWeb.Schema.Types.TypeUserRole do
  use Absinthe.Schema.Notation
  
  object :type_user_role do
    field :id, :integer
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
    field :role_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
