defmodule EshopWeb.CountryStageController do
  use EshopWeb, :controller

  alias Eshop.Geo
  alias Eshop.Geo.CountryStage

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    country_stages = Geo.list_country_stages()
    render(conn, "index.json", country_stages: country_stages)
  end

  def create(conn, %{"country_stage" => country_stage_params}) do
    with {:ok, %CountryStage{} = country_stage} <- Geo.create_country_stage(country_stage_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.country_stage_path(conn, :show, country_stage))
      |> render("show.json", country_stage: country_stage)
    end
  end

  def show(conn, %{"id" => id}) do
    country_stage = Geo.get_country_stage!(id)
    render(conn, "show.json", country_stage: country_stage)
  end

  def update(conn, %{"id" => id, "country_stage" => country_stage_params}) do
    country_stage = Geo.get_country_stage!(id)

    with {:ok, %CountryStage{} = country_stage} <- Geo.update_country_stage(country_stage, country_stage_params) do
      render(conn, "show.json", country_stage: country_stage)
    end
  end

  def delete(conn, %{"id" => id}) do
    country_stage = Geo.get_country_stage!(id)

    with {:ok, %CountryStage{}} <- Geo.delete_country_stage(country_stage) do
      send_resp(conn, :no_content, "")
    end
  end
end
