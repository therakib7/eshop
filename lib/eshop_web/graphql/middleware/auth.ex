defmodule EshopWeb.Graphql.Middleware.Auth do
  @behaviour Absinthe.Middleware

  def call(resolution, per) do
    with %{current_user: current_user} <- resolution.context,
        true do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, message: "Unauthorized", code: 401})
    end
  end

end
