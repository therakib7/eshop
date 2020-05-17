defmodule EshopWeb.TermConditionView do
  use EshopWeb, :view
  alias EshopWeb.TermConditionView

  def render("index.json", %{term_conditions: term_conditions}) do
    %{data: render_many(term_conditions, TermConditionView, "term_condition.json")}
  end

  def render("show.json", %{term_condition: term_condition}) do
    %{data: render_one(term_condition, TermConditionView, "term_condition.json")}
  end

  def render("term_condition.json", %{term_condition: term_condition}) do
    %{
      id: term_condition.id,
      type: term_condition.type,
      type_id: term_condition.type_id,
      content: term_condition.content,
      native_content: term_condition.native_content
    }
  end
end
