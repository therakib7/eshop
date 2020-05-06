defmodule EshopWeb.RatingController do
  use EshopWeb, :controller

  alias Eshop.Activities
  alias Eshop.Activities.Rating

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    ratings = Activities.list_ratings()
    render(conn, "index.json", ratings: ratings)
  end

  def create(conn, %{"rating" => rating_params}) do
    with {:ok, %Rating{} = rating} <- Activities.create_rating(rating_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.rating_path(conn, :show, rating))
      |> render("show.json", rating: rating)
    end
  end

  def show(conn, %{"id" => id}) do
    rating = Activities.get_rating!(id)
    render(conn, "show.json", rating: rating)
  end

  def update(conn, %{"id" => id, "rating" => rating_params}) do
    rating = Activities.get_rating!(id)

    with {:ok, %Rating{} = rating} <- Activities.update_rating(rating, rating_params) do
      render(conn, "show.json", rating: rating)
    end
  end

  def delete(conn, %{"id" => id}) do
    rating = Activities.get_rating!(id)

    with {:ok, %Rating{}} <- Activities.delete_rating(rating) do
      send_resp(conn, :no_content, "")
    end
  end
end
