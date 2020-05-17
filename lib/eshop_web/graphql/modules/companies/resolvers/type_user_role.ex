defmodule EshopWeb.Schema.Resolvers.TypeUserRole do
  def list_type_user_roles(_parent, _args, _resolution) do
    {:ok, Eshop.Companies.list_type_user_roles()}
  end

  def get_type_user_role(_, %{id: id}, _) do
    {:ok, Eshop.Companies.get_type_user_role!(id)}
  end

  def create_type_user_role(_parent, args, _resolution) do
    Eshop.Companies.create_type_user_role(args)
  end

  def update_type_user_role(%{id: id, type_user_role_params: type_user_role_params}, _info) do
    case {:ok, Eshop.Companies.get_type_user_role!(id)} do
      {:ok, type_user_role} ->
        type_user_role |> Eshop.Companies.update_type_user_role(type_user_role_params)
    end
  end

  def delete_type_user_role(%{id: id}, _info) do
    case {:ok, Eshop.Companies.get_type_user_role!(id)} do
      {:ok, type_user_role} -> type_user_role |> Eshop.Companies.delete_type_user_role()
    end
  end
end
