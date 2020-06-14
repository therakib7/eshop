defmodule Eshop.Components.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :is_active, :boolean, default: false
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    belongs_to :parent, Eshop.Components.Category
    belongs_to :attachment, Eshop.Attachments.Attachment
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:is_active, :order, :name, :native_name, :slug, :user_id])
    |> validate_required([:name, :native_name])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
    |> put_slug()
  end

  defp put_slug(%Ecto.Changeset{valid?: true, changes: %{name: name}} = changeset) do
    change(changeset, slug: String.downcase(name) |> String.replace(" ", "-"))
  end

  defp put_slug(changeset), do: changeset
end
