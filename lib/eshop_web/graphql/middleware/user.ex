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
         true <- checkPer(current_user, resolution.arguments, args) do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, message: "Permission Denided", code: 401})
    end
  end

  defp checkPer(current_user, res_args, args) do
    user_id = String.to_integer(current_user["sub"])  
    per_list = Eshop.Repo.all(
      from m in Eshop.Users.UserRole,
        join: c in Eshop.Users.RolePermission,
        on: m.role_id == c.role_id,
        where: m.user_id == ^user_id,
        select: c.permission_id
    )

    # if self = self per and self_data
    
    # if Map.has_key?(args, :self) do
    #   if Enum.any?(args.per, fn x -> x in per_list end) && res_args.id ==  Eshop.Users.get_user!(user_id) do
    #     true 
        
    #   unless Enum.any?(args.com_admin_per, fn x -> x in per_list end) && Eshop.Users.get_user!(user_id) do
    #     true

    #   unless Enum.any?(args.super_admin_per, fn x -> x in per_list end) do
    #     true
    #   end
    # else 
    #   Enum.any?(args.per, fn x -> x in per_list end)
    # end
    # IO.inspect()
    # IO.inspect(res_args)
    # IO.inspect(user_id)
    # IO.inspect(res_args.id == user_id)
    
    # can be check match all or one by any or all 
    # Enum.all?(["abc", "z"], fn x -> x in list end)
  end
end
