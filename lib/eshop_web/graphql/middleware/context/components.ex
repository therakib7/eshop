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

      "unit_type" ->
        EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)

      n when n in ["item_variant", "item_warehouse_variant", "faq"] ->
        common_per(args, res_args, user_id)

      "package" ->
        package(args, res_args, user_id)

      "package_item" ->
        package_item(args, res_args, user_id)

      "discount_code" ->
        discount_code(args, res_args, user_id)
    end
  end

  defp common_per(args, res_args, user_id) do
    shop_id =
      Eshop.Repo.one(
        from u in Eshop.Objects.Item, where: u.id == ^res_args.item_id, select: u.shop_id
      )

    EshopWeb.Graphql.Middleware.Role.type_user_role(3, shop_id, args.per, user_id) ||
      EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)
  end

  defp package(args, res_args, user_id) do
    shop_id =
      Eshop.Repo.one(
        from u in Eshop.Objects.Item, where: u.id == ^res_args.item_id, select: u.shop_id
      )

    EshopWeb.Graphql.Middleware.Role.type_user_role(3, shop_id, args.per, user_id) ||
      EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)
  end

  defp package_item(args, res_args, user_id) do
    item_id =
      Eshop.Repo.one(
        from u in Eshop.Components.Package, where: u.id == ^res_args.package_id, select: u.item_id
      )

    shop_id =
      Eshop.Repo.one(from u in Eshop.Objects.Item, where: u.id == ^item_id, select: u.shop_id)

    EshopWeb.Graphql.Middleware.Role.type_user_role(3, shop_id, args.per, user_id) ||
      EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)
  end

  defp discount_code(args, res_args, user_id) do
    EshopWeb.Graphql.Middleware.Role.type_user_role(3, res_args.shop_id, args.per, user_id) ||
      EshopWeb.Graphql.Middleware.Role.user_role(args, user_id)
  end
end
