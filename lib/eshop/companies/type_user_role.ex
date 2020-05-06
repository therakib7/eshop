defmodule Eshop.Companies.TypeUserRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "type_user_roles" do
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
    field :role_id, :id

    timestamps()
  end

  @doc false
  def changeset(type_user_role, attrs) do
    type_user_role
    |> cast(attrs, [:type, :type_id])
    |> validate_required([:type, :type_id])
  end
end
