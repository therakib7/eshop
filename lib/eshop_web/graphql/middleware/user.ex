defmodule EshopWeb.Graphql.Middleware.UserPer do
  @behaviour Absinthe.Middleware

  import Ecto.Query, only: [from: 2]


  def call(resolution, args) do
    # IO.inspect(resolution.arguments.id)
    auth = Map.has_key?(args, :auth)
    per = Map.has_key?(args, :per)
    if auth do
      if per do  
        # if resolution.context.curent_user do
        if true do
          permission(resolution, args)
        else 
          auth(resolution) 
        end
        
        # IO.inspect("check permission")
      else 
        auth(resolution)
      end
    else 
      resolution
    end

  end

  def auth(resolution) do
    with %{current_user: current_user} <- resolution.context,
          true do
        resolution
    else
        _ ->
          resolution
          |> Absinthe.Resolution.put_result({:error, message: "Unauthorized", code: 401})
    end
  end

  def permission(resolution, args) do
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
    true
  end

end
