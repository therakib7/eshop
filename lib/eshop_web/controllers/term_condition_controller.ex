defmodule EshopWeb.TermConditionController do
  use EshopWeb, :controller

  alias Eshop.Conditions
  alias Eshop.Conditions.TermCondition

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    term_conditions = Conditions.list_term_conditions()
    render(conn, "index.json", term_conditions: term_conditions)
  end

  def create(conn, %{"term_condition" => term_condition_params}) do
    with {:ok, %TermCondition{} = term_condition} <- Conditions.create_term_condition(term_condition_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.term_condition_path(conn, :show, term_condition))
      |> render("show.json", term_condition: term_condition)
    end
  end

  def show(conn, %{"id" => id}) do
    term_condition = Conditions.get_term_condition!(id)
    render(conn, "show.json", term_condition: term_condition)
  end

  def update(conn, %{"id" => id, "term_condition" => term_condition_params}) do
    term_condition = Conditions.get_term_condition!(id)

    with {:ok, %TermCondition{} = term_condition} <- Conditions.update_term_condition(term_condition, term_condition_params) do
      render(conn, "show.json", term_condition: term_condition)
    end
  end

  def delete(conn, %{"id" => id}) do
    term_condition = Conditions.get_term_condition!(id)

    with {:ok, %TermCondition{}} <- Conditions.delete_term_condition(term_condition) do
      send_resp(conn, :no_content, "")
    end
  end
end
