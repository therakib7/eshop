defmodule EshopWeb.Schema.Resolvers.CompanySetting do
  def list_company_settings(_parent, _args, _resolution) do
    {:ok, Eshop.Settings.list_company_settings()}
  end

  def get_company_setting(_, %{id: id}, _) do
    {:ok, Eshop.Settings.get_company_setting!(id)}
  end

  def create_company_setting(_parent, args, _resolution) do
    Eshop.Settings.create_company_setting(args)
  end

  def update_company_setting(%{id: id, company_setting_params: company_setting_params}, _info) do
    case {:ok, Eshop.Settings.get_company_setting!(id)} do
      {:ok, company_setting} ->
        company_setting |> Eshop.Settings.update_company_setting(company_setting_params)
    end
  end

  def delete_company_setting(%{id: id}, _info) do
    case {:ok, Eshop.Settings.get_company_setting!(id)} do
      {:ok, company_setting} -> company_setting |> Eshop.Settings.delete_company_setting()
    end
  end
end
