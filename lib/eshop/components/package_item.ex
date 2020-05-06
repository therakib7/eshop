defmodule Eshop.Components.PackageItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "package_items" do
    field :name, :string
    field :native_name, :string
    field :package_id, :id

    timestamps()
  end

  @doc false
  def changeset(package_item, attrs) do
    package_item
    |> cast(attrs, [:name, :native_name])
    |> validate_required([:name, :native_name])
  end
end
