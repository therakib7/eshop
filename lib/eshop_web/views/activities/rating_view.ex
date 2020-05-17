defmodule EshopWeb.RatingView do
  use EshopWeb, :view
  alias EshopWeb.RatingView

  def render("index.json", %{ratings: ratings}) do
    %{data: render_many(ratings, RatingView, "rating.json")}
  end

  def render("show.json", %{rating: rating}) do
    %{data: render_one(rating, RatingView, "rating.json")}
  end

  def render("rating.json", %{rating: rating}) do
    %{
      id: rating.id,
      type: rating.type,
      type_id: rating.type_id,
      comment: rating.comment,
      star: rating.star
    }
  end
end
