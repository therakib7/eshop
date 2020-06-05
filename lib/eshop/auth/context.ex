defmodule Eshop.Auth.Context do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    # IO.inspect(conn.body_params)
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Eshop.Guardian.decode_and_verify(token),
         {:ok, user} <- Eshop.Guardian.on_verify(claims, token) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
