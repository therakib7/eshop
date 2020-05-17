defmodule Eshop.Users.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_profiles" do
    field :date_of_birth, :utc_datetime
    field :gender, :integer
    field :lat, :float
    field :long, :float
    field :merital_status, :integer

    belongs_to :user, Eshop.Users.User
    belongs_to :pre_location, Eshop.Geo.Location
    belongs_to :per_location, Eshop.Geo.Location

    timestamps()
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:lat, :long, :merital_status, :gender])
    |> validate_number(:lat, greater_than_or_equal_to: -90, less_than_or_equal_to: 90)
    |> validate_number(:long, greater_than_or_equal_to: -180, less_than_or_equal_to: 180)
    |> validate_inclusion(:merital_status, 1..4)
    |> validate_inclusion(:gender, 1..3)
  end
end
