defmodule EshopWeb.CountryStageView do
  use EshopWeb, :view
  alias EshopWeb.CountryStageView

  def render("index.json", %{country_stages: country_stages}) do
    %{data: render_many(country_stages, CountryStageView, "country_stage.json")}
  end

  def render("show.json", %{country_stage: country_stage}) do
    %{data: render_one(country_stage, CountryStageView, "country_stage.json")}
  end

  def render("country_stage.json", %{country_stage: country_stage}) do
    %{id: country_stage.id,
      country_id: country_stage.country_id,
      stage: country_stage.stage,
      name: country_stage.name,
      native_name: country_stage.native_name,
      user_id: country_stage.user_id}
  end
end
