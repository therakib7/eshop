defmodule EshopWeb.Graphql.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  import Ecto.Query, only: [from: 2]

  def call(resolution, per) do
    with %{current_user: current_user} <- resolution.context,
         true <- correct_per?(current_user, per) do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, message: "Unauthorized", code: 401})
    end
  end

  defp correct_per?(%{}, :any), do: true

  @doc """
    |> Get Current user_id = current_user["sub"]
    |> Get current user role_id
    |> Get permission_id by role_id 
    |> All query save in redis memory 
  """
  defp correct_per?(current_user, per) do
    user_id = String.to_integer(current_user["sub"])
    Eshop.Repo.all(from m in Eshop.Users.UserRole, join: c in Eshop.Users.RolePermission, on: m.role_id == c.role_id, where: m.user_id == ^user_id, select: c.permission_id) 
    |> Enum.member?(per) 
    
  end
  defp correct_per?(_, _), do: false
end
