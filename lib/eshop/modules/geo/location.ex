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
    belongs_to :parent, Eshop.Geo.Location
    belongs_to :stage, Eshop.Geo.CountryStage
    belongs_to :user, Eshop.Users.User
    field :web, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:is_active, :country_id, :stage_id, :parent_id, :name, :native_name, :order, :code, :lat, :long, :web, ])
    |> validate_required([:is_active, :country_id, :stage_id, :parent_id, :name, :native_name, :order, :code, :lat, :long, :web])
    |> validate_number(:lat, greater_than_or_equal_to: -90, less_than_or_equal_to: 90)
    |> validate_number(:long, greater_than_or_equal_to: -180, less_than_or_equal_to: 180)
  end
end
