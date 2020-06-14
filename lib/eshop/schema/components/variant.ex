defmodule Eshop.Components.Variant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "variants" do
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    belongs_to :user, Eshop.Users.User
    belongs_to :shop, Eshop.Companies.Shop
    # has_many :categories, Eshop.Components.TypeCategory

    timestamps()
  end

  @doc false
  def changeset(variant, attrs) do
    variant
    |> cast(attrs, [:order, :name, :native_name, :type, :user_id])
    |> validate_required([:name, :native_name, :type])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 1, max: 200)
  end
end
