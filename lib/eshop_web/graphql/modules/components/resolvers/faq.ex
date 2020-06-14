defmodule EshopWeb.Schema.Resolvers.Faq do
  def list_faqs(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_faqs()}
  end

  def get_faq(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_faq!(id)}
  end

  def create_faq(_parent, args, %{context: %{current_user: current_user}}) do
    args = Map.put(args, :user_id, current_user["sub"])
    Eshop.Components.create_faq(args)
  end

  def update_faq(%{id: id, faq_params: faq_params}, _info) do
    case {:ok, Eshop.Components.get_faq!(id)} do
      {:ok, faq} -> faq |> Eshop.Components.update_faq(faq_params)
    end
  end

  def delete_faq(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_faq!(id)} do
      {:ok, faq} -> faq |> Eshop.Components.delete_faq()
    end
  end
end
