defmodule EshopWeb.Graphql.Middleware.Components do
  import Ecto.Query, only: [from: 2]

  def context(args, res_args, user_id) do
    case args.model do
      "category" ->
        EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)

      "brand" ->
        EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)

      "variant" ->
        EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)

      "faq" ->
        faq(args, res_args, user_id)
        # "role" -> roles()
    end
  end

  defp faq(args, res_args, user_id) do
    shop_id =
      Eshop.Repo.one(
        from u in Eshop.Objects.Item, where: u.id == ^res_args.item_id, select: u.shop_id
      )

    res_args = Map.put(res_args, :shop_id, shop_id)

    EshopWeb.Graphql.Middleware.Role.type_user_role(3, args, res_args, user_id) ||
      EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)
  end
end
