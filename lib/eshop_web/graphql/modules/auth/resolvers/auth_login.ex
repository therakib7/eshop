defmodule EshopWeb.Schema.Resolvers.AuthLogin do
    def login(%{email: email, password: password}, _info) do
        with {:ok, user} <- Eshop.Auth.UserManager.authenticate_user(email, password),
            {:ok, jwt, _} <- Eshop.Auth.UserManager.Guardian.encode_and_sign(user) do
            {:ok, %{id: jwt}}
        end
    end
end