defmodule Eshop.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :last_name, :string
    field :mobile, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :pin, :integer
    field :verified_email, :utc_datetime
    field :verified_phone, :utc_datetime
    field :verified_user, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user 
    |> cast(attrs, [:is_active, :first_name, :last_name, :email, :mobile, :password, :password_confirmation, :pin])
    |> validate_required([:first_name, :password])
    |> validate_confirmation(:password)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, downcase: true)
    |> validate_length(:password, min: 8, max: 80)
    |> validate_length(:pin, min: 4, max: 10)
    #|> put_password_hash()
  end

  # defp put_password_hash(changeset) do
  #   case changeset do
  #     %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
  #       put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pass))
  #     _ ->
  #       changeset
  #   end
  # end
end
