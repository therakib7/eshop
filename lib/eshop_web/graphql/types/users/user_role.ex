defmodule EshopWeb.Schema.Types.UserRole do
    use Absinthe.Schema.Notation

  object :user_role do
    field :user_id, :id
    field :role_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end
end
