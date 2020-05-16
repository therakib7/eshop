defmodule Eshop.Auth.Context do

  @behaviour Plug

  import Plug.Conn 
         
  def init(opts), do: opts
   
  def call(conn, _) do
    case build_context(conn) do
      {:ok, context} ->
      put_private(conn, :absinthe, %{context: context})
      _ ->
      conn
    end
  end
  
  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
      {:ok, claims} <- Eshop.Guardian.decode_and_verify(token),
      {:ok, current_user} <- Eshop.Guardian.on_verify(claims, token) do
      {:ok, %{current_user: current_user, token: token}}
    end
  end
end

