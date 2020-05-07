defmodule EshopWeb.CompanyView do
  use EshopWeb, :view
  alias EshopWeb.CompanyView

  def render("index.json", %{companies: companies}) do
    %{data: render_many(companies, CompanyView, "company.json")}
  end

  def render("show.json", %{company: company}) do
    %{data: render_one(company, CompanyView, "company.json")}
  end

  def render("company.json", %{company: company}) do
    %{id: company.id,
      is_active: company.is_active,
      is_verifed: company.is_verifed,
      name: company.name,
      trade_assurance: company.trade_assurance,
      highest_assurance: company.highest_assurance,
      golden_supplier: company.golden_supplier,
      created_at: company.created_at}
  end
end
