defmodule EshopWeb.FaqView do
  use EshopWeb, :view
  alias EshopWeb.FaqView

  def render("index.json", %{faqs: faqs}) do
    %{data: render_many(faqs, FaqView, "faq.json")}
  end

  def render("show.json", %{faq: faq}) do
    %{data: render_one(faq, FaqView, "faq.json")}
  end

  def render("faq.json", %{faq: faq}) do
    %{
      id: faq.id,
      question: faq.question,
      native_question: faq.native_question,
      content: faq.content,
      native_content: faq.native_content
    }
  end
end
