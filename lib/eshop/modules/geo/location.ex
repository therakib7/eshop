defmodule Eshop.Geo.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :code, :string
    field :country_id, :integer
    field :is_active, :boolean, default: false
    field :lat, :float
    field :long, :float
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :parent_id, :integer
    field :stage_id, :integer
    field :user_id, :integer
    field :web, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:is_active, :country_id, :stage_id, :parent_id, :name, :native_name, :order, :code, :lat, :long, :web, :user_id])
    |> validate_required([:is_active, :country_id, :stage_id, :parent_id, :name, :native_name, :order, :code, :lat, :long, :web, :user_id])
  end
end
