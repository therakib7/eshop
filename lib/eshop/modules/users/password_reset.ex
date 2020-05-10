defmodule Eshop.Users.PasswordReset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "password_resets" do
    field :created_at, :utc_datetime
    field :token, :string
    field :user_id, :id
    
  end

  @doc false
  def changeset(password_reset, attrs) do
    password_reset
    |> cast(attrs, [:token, :user_id])
    |> validate_required([:token, :user_id])
  end
end
