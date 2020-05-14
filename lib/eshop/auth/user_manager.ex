## lib/auth_me/user_manager.ex
defmodule Eshop.Auth.UserManager do

    import Ecto.Query, only: [from: 2]

    def authenticate_user(email, plain_text_password) do
        query = from u in Eshop.Users.User, where: u.email == ^email
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
end