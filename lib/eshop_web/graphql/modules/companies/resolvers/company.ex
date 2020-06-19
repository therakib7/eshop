defmodule EshopWeb.Schema.Resolvers.Company do
  def list_companies(_parent, args, _resolution) do
    Absinthe.Relay.Connection.from_query(
      Eshop.Companies.list_companies(args),
      &Eshop.Repo.all/1,
      args
    )
  end

  def get_company(_, %{id: id}, _) do
    {:ok, Eshop.Companies.get_company!(id)}
  end

  def create_company(_parent, args, %{context: %{current_user: current_user}}) do
    # args = Map.put(args, :created_at, current_user["sub"])
    Eshop.Companies.create_company(args)
  end

  def update_company(%{id: id, company_params: company_params}, _info) do
    case {:ok, Eshop.Companies.get_company!(id)} do
      {:ok, company} -> company |> Eshop.Companies.update_company(company_params)
    end
  end

  def delete_company(%{id: id}, _info) do
    case {:ok, Eshop.Companies.get_company!(id)} do
      {:ok, company} -> company |> Eshop.Companies.delete_company()
    end
  end
end
