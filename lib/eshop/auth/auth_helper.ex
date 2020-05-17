## lib/auth/auth_helper.ex
defmodule Eshop.AuthHelper do
  import Ecto.Query, only: [from: 2]

  def authenticate_user(email, plain_text_password) do
    query =
      if validate(email) do
        query = from u in Eshop.Users.User, where: u.email == ^email
      else
        query = from u in Eshop.Users.User, where: u.mobile == ^email
      end

    case Eshop.Repo.one(query) do
      nil ->
        Argon2.no_user_verify()
        {:error, :invalid_credentials}

      user ->
        if Argon2.verify_pass(plain_text_password, user.password_hash) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end

  def validate(email) do
    String.match?(email, ~r/.+@[^\.]+.*/)
  end
end
