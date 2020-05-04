defmodule Eshop.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :last_name, :string
    field :mobile, :string
    field :password_hash, :string
    field :pin, :integer
    field :verified_email, :naive_datetime
    field :verified_phone, :naive_datetime
    field :verified_user, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:is_active, :first_name, :last_name, :email, :mobile, :password, :pin])
    |> validate_required([:is_active, :first_name, :last_name, :email, :mobile, :pin, :password_hash, :verified_user, :verified_email, :verified_phone])
  end
end
