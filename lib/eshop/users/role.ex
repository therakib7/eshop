defmodule Eshop.Users.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :desc, :string
    field :is_company, :boolean, default: false
    field :name, :string
    field :slug, :string
    field :native_name, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :slug, :native_name, :desc])
    |> validate_required([:name, :native_name, :desc])
    |> unique_constraint(:slug)
  end
end
