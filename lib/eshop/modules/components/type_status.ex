defmodule Eshop.Components.TypeStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "type_statuses" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :type, :integer
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(type_status, attrs) do
    type_status
    |> cast(attrs, [:is_active, :order, :type, :name, :native_name])
    |> validate_required([:is_active, :order, :type, :name, :native_name])
    |> validate_length(:name, min: 1, max: 50)
    |> validate_length(:native_name, min: 1, max: 50)

  end
end
