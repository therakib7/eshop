defmodule Eshop.Users.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_profiles" do
    field :date_of_birth, :utc_datetime
    field :gender, :integer
    field :lat, :float
    field :long, :float
    field :merital_status, :integer
    field :user_id, :id
    field :pre_location_id, :id
    field :per_location_id, :id

    #belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:lat, :long, :date_of_birth, :merital_status, :gender])
    |> validate_required([:lat, :long, :date_of_birth, :merital_status, :gender])
  end
end
