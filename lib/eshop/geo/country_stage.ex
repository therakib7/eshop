defmodule Eshop.Geo.CountryStage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "country_stages" do
    field :country_id, :integer
    field :name, :string
    field :native_name, :string
    field :stage, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(country_stage, attrs) do
    country_stage
    |> cast(attrs, [:country_id, :stage, :name, :native_name, :user_id])
    |> validate_required([:country_id, :stage, :name, :native_name, :user_id])
  end
end
