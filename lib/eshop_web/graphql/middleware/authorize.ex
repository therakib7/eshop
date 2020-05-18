defmodule EshopWeb.Graphql.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  def call(resolution, mob) do
    with %{current_user: current_user} <- resolution.context,
         true <- correct_mobile?(current_user, mob) do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "unauthorized"})
    end
  end

  defp correct_mobile?(%{}, :any), do: true

  defp correct_mobile?(current_user, mob) do 
     
    IO.inspect current_user["sub"] 
    if current_user["sub"] == "4" do
      true
    else 
      false
    end
  end
  defp correct_mobile?(_, _), do: false
end