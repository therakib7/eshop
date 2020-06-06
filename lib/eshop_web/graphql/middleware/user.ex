defmodule EshopWeb.Graphql.Middleware.UserPer do
  @behaviour Absinthe.Middleware

  import Ecto.Query, only: [from: 2]


  def call(resolution, args) do
    IO.inspect(resolution.arguments.id)
    with %{current_user: current_user} <- resolution.context,
         true <- correct_per?(current_user, args) do
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

  defp correct_per?(current_user, args) do
    # if(args.model == 'user') {
    #   id = Eshop.Users.get_user!(id) 
    # } else if(args.model == 'company') {
    #   id = Eshop.Companies.get_company!(id) 
    # } else if(args.model == 'shop') {
    #   id = Eshop.Companies.get_shop!(id) 
    # }

  

    false
  end

  defp correct_per?(_, _), do: false
end
