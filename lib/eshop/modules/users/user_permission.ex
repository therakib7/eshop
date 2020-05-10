defmodule Eshop.Users.UserPermission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_permissions" do
    belongs_to :user, Eshop.Users.User
    belongs_to :permission, Eshop.Users.Permission

    timestamps()
  end

  @doc false
  def changeset(user_permission, attrs) do
    user_permission
    |> cast(attrs, [:user_id,:permission_id])
    |> validate_required([:user_id, :permission_id])
  end
end
