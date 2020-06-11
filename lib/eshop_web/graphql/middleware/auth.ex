defmodule EshopWeb.Graphql.Middleware.Auth do
  @behaviour Absinthe.Middleware

  import Ecto.Query, only: [from: 2]

  def call(resolution, args) do
    # IO.inspect(resolution.arguments.id) 

    if Map.has_key?(args, :auth) do
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

    if Map.has_key?(args, :per) do
      checkSelf(args, res_args, user_id)
    end
  end

  defp checkSelf(args, res_args, user_id) do
    case args.context do
      "users" -> EshopWeb.Graphql.Middleware.Users.context(args, res_args, user_id)
      "objects" -> EshopWeb.Graphql.Middleware.Objects.context(args, res_args, user_id)
      "components" -> EshopWeb.Graphql.Middleware.Components.context(args, res_args, user_id)
    end
  end
end
