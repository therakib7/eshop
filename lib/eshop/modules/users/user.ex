defmodule Eshop.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :surname, :string
    field :mobile, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :pin, :integer
    field :token, :string
    field :verified_email, :utc_datetime
    field :verified_phone, :utc_datetime
    field :verified_user, :utc_datetime
    # has_many :roles, Eshop.Users.UserRole

    has_one :profile, Eshop.Users.UserProfile

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :is_active,
      :first_name,
      :surname,
      :email,
      :mobile,
      :password,
      :password_confirmation,
      :pin
    ])
    |> validate_required([:first_name, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> update_change(:email, &String.downcase/1)
    |> validate_length(:password, min: 8, max: 80)
    |> validate_inclusion(:pin, 100000..9999999999)
    |> validate_confirmation(:password)
    |> put_password_hash()
    |> validate_format(:password, ~r/[0-9]+/, message: "Password must contain a number")
    |> validate_format(:password, ~r/[a-zA-Z]+/, message: "Password must contain a letter")
    |> validate_confirmation(:password)
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password_hash: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
