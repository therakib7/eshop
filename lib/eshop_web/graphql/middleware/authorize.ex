# defmodule EshopWeb.Graphql.Middleware.Authorize do
#   @behaviour Absinthe.Middleware

#   def call(resolution, mobile) do
#     case resolution.context do
#       %{current_user: _} ->
#         resolution

#       _ ->
#         resolution
#         |> Absinthe.Resolution.put_result({:error, "unauthenticated"})
#     end
#   end
# end

defmodule EshopWeb.Graphql.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, mobile) do
    with %{current_user: current_user} <- resolution.context,
         true <- correct_mobile?(current_user, mobile) do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "unauthorized"})
    end
  end

  defp correct_mobile?(%{}, :any), do: true
  defp correct_mobile?(%{mobile: mobile}, mobile), do: true
  defp correct_mobile?(_, _), do: false
end