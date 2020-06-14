defmodule EshopWeb.Schema.Types.UserPermission do
  use Absinthe.Schema.Notation

  @desc "A user_permission"
  object :user_permission do
    field :id, :integer
    field :user_id, :integer
    field :permission_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A user_permission update"
  input_object :user_permission_params do
    field :user_id, :integer
    field :permission_id, :integer
  end
end
