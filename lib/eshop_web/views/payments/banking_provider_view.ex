defmodule EshopWeb.BankingProviderView do
  use EshopWeb, :view
  alias EshopWeb.BankingProviderView

  def render("index.json", %{banking_providers: banking_providers}) do
    %{data: render_many(banking_providers, BankingProviderView, "banking_provider.json")}
  end

  def render("show.json", %{banking_provider: banking_provider}) do
    %{data: render_one(banking_provider, BankingProviderView, "banking_provider.json")}
  end

  def render("banking_provider.json", %{banking_provider: banking_provider}) do
    %{
      id: banking_provider.id,
      is_active: banking_provider.is_active,
      type: banking_provider.type,
      name: banking_provider.name,
      native_name: banking_provider.native_name,
      order: banking_provider.order
    }
  end
end
