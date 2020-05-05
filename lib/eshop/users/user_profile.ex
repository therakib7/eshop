defmodule Eshop.Users.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_profiles" do
    field :date_of_birth, :string
    field :gender, :integer
    field :integer, :string
    field :lat, :float
    field :long, :float
    field :merital_status, :string
    field :utc_datetime, :string
    field :user_id, :id
    field :pre_location_id, :id
    field :per_location_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:lat, :long, :date_of_birth, :utc_datetime, :merital_status, :integer, :gender])
    |> validate_required([:lat, :long, :date_of_birth, :utc_datetime, :merital_status, :integer, :gender])
  end
end
