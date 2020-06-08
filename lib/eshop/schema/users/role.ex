defmodule Eshop.Users.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :desc, :string
    field :type, :integer
    field :name, :string
    field :slug, :string
    field :native_name, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :slug, :native_name, :desc, :type])
    |> validate_required([:name])
    |> validate_length(:name, min: 2, max: 100)
    |> validate_length(:native_name, min: 2, max: 100)
    |> validate_length(:desc, min: 2, max: 500)
    |> unique_constraint(:slug)
  end
end
