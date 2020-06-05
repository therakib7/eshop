defmodule EshopWeb.Graphql.Middleware.Permission do
  @behaviour Absinthe.Middleware

  import Ecto.Query, only: [from: 2]

  def call(resolution, per) do
    IO.inspect(per) 
    with %{current_user: current_user} <- resolution.context,
         true <- correct_per?(current_user, per) do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, message: "Permission Denied", code: 303})
    end
  end

  defp correct_per?(%{}, :any), do: true

  # Get Current user_id = current_user["sub"]
  # Get current user role_id
  # Get permission_id by role_id 
  # All query save in redis memory 

  defp correct_per?(current_user, per) do
    false
  end

  defp correct_per?(_, _), do: false
end
