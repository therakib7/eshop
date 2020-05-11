defmodule Eshop.Components.PackageItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "package_items" do
    field :name, :string
    field :native_name, :string
    belongs_to :package, Eshop.Components.Package 
    

    timestamps()
  end

  @doc false
  def changeset(package_item, attrs) do
    package_item
    |> cast(attrs, [:name, :native_name])
    |> validate_required([:name, :native_name])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
  end
end
