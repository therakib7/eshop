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
    |> validate_required([:is_active, :name, :native_name, :slug])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
  end
end
