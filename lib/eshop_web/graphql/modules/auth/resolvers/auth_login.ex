defmodule EshopWeb.Schema.Resolvers.AuthLogin do
  def login(%{email: email, password: password}, _info) do
    with {:ok, user} <- Eshop.AuthHelper.authenticate_user(email, password),
         {:ok, jwt, claims} <- Eshop.Guardian.encode_and_sign(user),
         {:ok, token} <- Eshop.Guardian.after_encode_and_sign(%{"sub" => user.id}, claims, jwt) do
      {:ok, %{token: jwt}}
    end
  end
end
