defmodule EshopWeb.Graphql.Middleware.UserPer do
  @behaviour Absinthe.Middleware

  import Ecto.Query, only: [from: 2]

  def call(resolution, args) do
    # IO.inspect(resolution.arguments.id) 
    
    if Map.has_key?(args, :auth)  do
      auth(resolution)
    else 
      if Map.has_key?(resolution.context, :current_user) do
        permission(resolution, args)
      else
        auth(resolution)
      end
    end
  end

  defp auth(resolution) do
    with %{current_user: current_user} <- resolution.context,
         true do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, message: "Unauthorized", code: 401})
    end
  end

  defp permission(resolution, args) do
    with %{current_user: current_user} <- resolution.context,
         true <- checkPer(current_user, args) do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, message: "Permission Denided", code: 401})
    end
  end

  defp checkPer(current_user, args) do
    user_id = String.to_integer(current_user["sub"])  
    per_list = Eshop.Repo.all(
      from m in Eshop.Users.UserRole,
        join: c in Eshop.Users.RolePermission,
        on: m.role_id == c.role_id,
        where: m.user_id == ^user_id,
        select: c.permission_id
    )
    
    Enum.any?(args.per, fn x -> x in per_list end)
    # can be check match all or one by any or all 
    # Enum.all?(["abc", "z"], fn x -> x in list end)
  end
end
