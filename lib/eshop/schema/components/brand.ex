defmodule Eshop.Components.Brand do
  use Ecto.Schema
  import Ecto.Changeset

  schema "brands" do
    field :is_active, :boolean, default: false
    field :order, :integer
    field :loves, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    belongs_to :attachment, Eshop.Attachments.Attachment
    belongs_to :user, Eshop.Users.User
    belongs_to :location, Eshop.Geo.Location

    timestamps()
  end

  @doc false
  def changeset(brand, attrs) do
    brand
    |> cast(attrs, [:is_active, :order, :name, :native_name, :slug, :loves, :user_id])
    |> validate_required([:name, :native_name])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
    |> put_slug()
  end

  defp put_slug(
         %Ecto.Changeset{valid?: true, changes: %{name: name}} = changeset
       ) do
    change(changeset, slug: String.downcase(name) |> String.replace(" ", "-"))
  end

  defp put_slug(changeset), do: changeset
end
