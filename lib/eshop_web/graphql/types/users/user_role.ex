defmodule EshopWeb.Schema.Types.UserRole do
    use Absinthe.Schema.Notation

  object :user_roles do
    field :user_id, :id
    field :role_id, :id
  end
end
