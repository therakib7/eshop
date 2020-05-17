defmodule EshopWeb.Schema.Resolvers.User do
 
  alias Eshop.Users 
  import Ecto.Query, only: [from: 2]

  def list_users(_parent, _args, _resolution) do
    # {:ok, Eshop.Users.list_users()}
    query =
      from u in Eshop.Users.UserRole,
        where: u.user_id == 13,
        select: %{id: u.id, user_id: u.user_id}
    hello = Eshop.Repo.all(query)
    {:ok, hello}
  end


  # def list_users(_parent, _args, _resolution) do
  #   #{:ok, Eshop.Users.list_users()} 
  #   roles = from(m in Eshop.Users.UserRole, where: m.user_id == 1, select: %{role_id: m.role_id}, join: p in Eshop.Users.RolePermission, on: m.role_id == p.role_id, )       
  #   hhh = Eshop.Repo.all(roles) 

    

  #   #roles = Enum.map(roles, fn (x) -> x["role_id"] end)
  #   #roles = Enum.map(roles, & &1["role_id"])

  #   # pers = from(m in Eshop.Users.RolePermission, where: m.role_id in ^[1,2], select: %{permission_id: m.permission_id})       
  #   # pers = Eshop.Repo.all(pers)  

  #   # per_slugs = from(m in Eshop.Users.Permission, where: m.id == 1, select: %{slug: m.slug})       
  #   # per_slugs = Eshop.Repo.all(per_slugs)  

  #   {:ok, hhh}
  # end

  def get_user(_, %{id: id}, _resolution) do
    {:ok, Eshop.Users.get_user!(id)}
  end

  def create_user(_parent, args, _resolution) do
    Eshop.Users.create_user(args)
  end

  def update_user(%{id: id, user_params: user_params}, _info) do
    case {:ok, Eshop.Users.get_user!(id)} do
      {:ok, user} -> user |> Eshop.Users.update_user(user_params)
    end
  end

  def delete_user(%{id: id}, _info) do
    case {:ok, Eshop.Users.get_user!(id)} do
      {:ok, user} -> user |> Eshop.Users.delete_user()
    end
  end
end
