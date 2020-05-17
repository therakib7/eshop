defmodule EshopWeb.Schema.Types.UserRole do
  use Absinthe.Schema.Notation

  @desc "A user_role"
  object :user_role do
    field :id, :integer
    field :user_id, :id
    field :role_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A user_role update"
  input_object :user_role_params do
    field :user_id, :id
    field :role_id, :id
  end
end
