defmodule EshopWeb.Graphql.Middleware.Role do
  import Ecto.Query, only: [from: 2]

  def user_role(args, user_id) do
    per_id =
      Eshop.Repo.one(from u in Eshop.Users.Permission, where: u.slug == ^args.per, select: u.id)

    per_list =
      Eshop.Repo.all(
        from m in Eshop.Users.UserRole,
          join: c in Eshop.Users.RolePermission,
          on: m.role_id == c.role_id,
          where: m.user_id == ^user_id,
          select: c.permission_id
      )

    Enum.member?(per_list, per_id)
  end

  def type_user_role(type, type_id, per, user_id) do
    per_id =
      Eshop.Repo.one(from u in Eshop.Users.Permission, where: u.slug == ^per, select: u.id)

    per_list =
      Eshop.Repo.all(
        from m in Eshop.Companies.TypeUserRole,
          join: c in Eshop.Users.RolePermission,
          on: m.role_id == c.role_id,
          where: [type: ^type, type_id: ^type_id, user_id: ^user_id],
          select: c.permission_id
      )

    Enum.member?(per_list, per_id)
  end
end
