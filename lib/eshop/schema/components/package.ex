defmodule Eshop.Components.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packages" do
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :title, :string
    field :native_title, :string
    field :subtitle, :string
    field :native_subtitle, :string
    field :content, {:array, :string}
    field :native_content, {:array, :string}
    belongs_to :item, Eshop.Objects.Item
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [
      :cost_price,
      :unit_price,
      :sale_price,
      :title,
      :native_title,
      :subtitle,
      :native_subtitle,
      :content,
      :native_content,
      :item_id,
      :user_id
    ])
    |> validate_required([:item_id, :sale_price])
  end
end
