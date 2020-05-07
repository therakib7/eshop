defmodule EshopWeb.Schema.Types.UserRole do
    use Absinthe.Schema.Notation

  object :user_role do
    field :user_id, :id
    field :role_id, :id
    field :inserted_at, :datetime
    field :updated_at, :datetime
  end
end
