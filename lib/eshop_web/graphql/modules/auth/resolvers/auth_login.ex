defmodule EshopWeb.Schema.Resolvers.AuthLogin do
    def login(%{email: email, password: password}, _info) do
        # with {:ok, user} <- Eshop.AuthHelper.authenticate_user(email, password),
        #     {:ok, jwt, _} <- Eshop.Guardian.encode_and_sign(user),
        #     {:ok, _} <- Eshop.Guardian.after_encode_and_sign(user)  do
        #     {:ok, %{id: jwt}}
        # end
        with {:ok, user} <- Eshop.AuthHelper.authenticate_user(email, password),
            {:ok, jwt, _} <- Eshop.Guardian.encode_and_sign(user) do
            {:ok, %{id: jwt}}
        end
    end
end