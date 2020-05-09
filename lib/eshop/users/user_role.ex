defmodule Eshop.Users.UserRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_roles" do
    field :user_id, :id
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_role, attrs) do
    user_role
    |> cast(attrs, [:user_id, :role_id])
    |> validate_required([:user_id, :role_id])
  end
end
