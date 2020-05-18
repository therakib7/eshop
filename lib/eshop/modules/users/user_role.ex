defmodule Eshop.Users.UserRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_roles" do
    belongs_to :user, Eshop.Users.User
    belongs_to :role, Eshop.Users.Role
    timestamps()

    many_to_many :role_permissions, Eshop.Users.RolePermission, join_through: "role_permissions"
  end

  @doc false
  def changeset(user_role, attrs) do
    user_role
    |> cast(attrs, [:user_id, :role_id])
    |> validate_required([:user_id, :role_id])
  end
end
