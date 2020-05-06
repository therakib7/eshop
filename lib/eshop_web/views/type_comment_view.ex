defmodule EshopWeb.TypeCommentView do
  use EshopWeb, :view
  alias EshopWeb.TypeCommentView

  def render("index.json", %{type_comments: type_comments}) do
    %{data: render_many(type_comments, TypeCommentView, "type_comment.json")}
  end

  def render("show.json", %{type_comment: type_comment}) do
    %{data: render_one(type_comment, TypeCommentView, "type_comment.json")}
  end

  def render("type_comment.json", %{type_comment: type_comment}) do
    %{id: type_comment.id,
      type: type_comment.type,
      type_id: type_comment.type_id,
      comment: type_comment.comment}
  end
end
