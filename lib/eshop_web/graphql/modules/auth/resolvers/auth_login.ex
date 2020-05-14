defmodule EshopWeb.Schema.Resolvers.AuthLogin do
    def login(%{email: email, password: password}, _info) do
        with {:ok, user} <- Eshop.Auth.UserManager.authenticate_user(email, password),
            {:ok, jwt, _} <- Eshop.Auth.UserManager.Guardian.encode_and_sign(user),
            {:ok, token} <- Eshop.AuthTokens.after_encode_and_sign(nil,user,jwt,nil)  do
            {:ok, %{id: token}}
        end
    end
end