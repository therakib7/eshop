defmodule EshopWeb.Graphql.Middleware.Objects do
  import Ecto.Query, only: [from: 2]

  def context(args, res_args, user_id) do
    case args.model do
      "item" ->
        items(args, res_args, user_id)
        # "role" -> roles()
    end
  end

  defp items(args, res_args, user_id) do
    EshopWeb.Graphql.Middleware.Role.type_user_role(3, args, res_args, user_id)
  end
end
