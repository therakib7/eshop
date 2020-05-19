defmodule EshopWeb.Schema.Resolvers.AuthLogin do
  def login(%{email: email, password: password}, _info) do
    with {:ok, user} <- Eshop.AuthHelper.authenticate_user(email, password),
         {:ok, jwt, claims} <- Eshop.Guardian.encode_and_sign(user),
         Eshop.Guardian.after_encode_and_sign(%{"sub" => user.id}, claims, jwt) do
      {:ok, %{token: jwt}}
    end
  end 

  def logout(%{token: token}, _info) do
    with {:ok, claims} <- Eshop.Guardian.decode_and_verify(token),
         Eshop.Guardian.on_revoke(claims, token) do
      {:ok, %{token: token}}
    end
  end
end
