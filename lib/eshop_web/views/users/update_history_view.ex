defmodule EshopWeb.UpdateHistoryView do
  use EshopWeb, :view
  alias EshopWeb.UpdateHistoryView

  def render("index.json", %{update_histories: update_histories}) do
    %{data: render_many(update_histories, UpdateHistoryView, "update_history.json")}
  end

  def render("show.json", %{update_history: update_history}) do
    %{data: render_one(update_history, UpdateHistoryView, "update_history.json")}
  end

  def render("update_history.json", %{update_history: update_history}) do
    %{
      id: update_history.id,
      type: update_history.type,
      type_id: update_history.type_id,
      key: update_history.key,
      old_value: update_history.old_value,
      new_value: update_history.new_value,
      created_at: update_history.created_at
    }
  end
end
