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
        |> Absinthe.Resolution.put_result({:error, "unauthorized"})
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

    role_ids =
      from(m in Eshop.Users.UserRole,
        where: m.user_id == ^user_id,
        select: %{role_id: m.role_id, id: m.id}
      )
      |> Eshop.Repo.all()
      |> Enum.map(fn x -> x.role_id end)

    per_ids =
      from(m in Eshop.Users.RolePermission,
        where: m.role_id in ^role_ids,
        select: %{permission_id: m.permission_id}
      )
      |> Eshop.Repo.all()
      |> Enum.map(fn x -> x.permission_id end)

    if Enum.member?(per_ids, per) do
      true
    else
      false
    end
  end
  defp correct_per?(_, _), do: false
end
