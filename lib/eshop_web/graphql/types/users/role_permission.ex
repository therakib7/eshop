defmodule EshopWeb.Schema.Types.RolePermission do
  use Absinthe.Schema.Notation

  @desc "A role_permission"
  object :role_permission do
    field :id, :integer
    field :role_id, :id
    field :permission_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A role_permission update"
  input_object :role_permission_params do 
    field :role_id, :id
    field :permission_id, :id
  end
end