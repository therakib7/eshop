defmodule EshopWeb.FaqController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.Faq

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    faqs = Components.list_faqs()
    render(conn, "index.json", faqs: faqs)
  end

  def create(conn, %{"faq" => faq_params}) do
    with {:ok, %Faq{} = faq} <- Components.create_faq(faq_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.faq_path(conn, :show, faq))
      |> render("show.json", faq: faq)
    end
  end

  def show(conn, %{"id" => id}) do
    faq = Components.get_faq!(id)
    render(conn, "show.json", faq: faq)
  end

  def update(conn, %{"id" => id, "faq" => faq_params}) do
    faq = Components.get_faq!(id)

    with {:ok, %Faq{} = faq} <- Components.update_faq(faq, faq_params) do
      render(conn, "show.json", faq: faq)
    end
  end

  def delete(conn, %{"id" => id}) do
    faq = Components.get_faq!(id)

    with {:ok, %Faq{}} <- Components.delete_faq(faq) do
      send_resp(conn, :no_content, "")
    end
  end
end
