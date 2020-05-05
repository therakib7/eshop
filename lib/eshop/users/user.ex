defmodule Eshop.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :last_name, :string
    field :mobile, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :pin, :integer
    field :verified_email, :utc_datetime
    field :verified_phone, :utc_datetime
    field :verified_user, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:is_active, :first_name, :last_name, :email, :mobile, :password, :pin])
    |> validate_required([:first_name  :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8, max: 80)
    |> validate_length(:pin, min: 4, max: 10)
  end
end
