defmodule EshopWeb.Graphql.Middleware.Objects do
  # import Ecto.Query, only: [from: 2]

  def context(args, res_args, user_id) do
    case args.model do
      "item" ->
        item(args, res_args, user_id)
        # "role" -> roles()
    end
  end

  defp item(args, res_args, user_id) do
    EshopWeb.Graphql.Middleware.Role.type_user_role(3, res_args.type_id, args.per, user_id) ||
      EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)
  end
end
