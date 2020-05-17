defmodule EshopWeb.Schema.Resolvers.TermCondition do
  def list_term_conditions(_parent, _args, _resolution) do
    {:ok, Eshop.Conditions.list_term_conditions()}
  end

  def get_term_condition(_, %{id: id}, _) do
    {:ok, Eshop.Conditions.get_term_condition!(id)}
  end

  def create_term_condition(_parent, args, _resolution) do
    Eshop.Conditions.create_term_condition(args)
  end

  def update_term_condition(%{id: id, term_condition_params: term_condition_params}, _info) do
    case {:ok, Eshop.Conditions.get_term_condition!(id)} do
      {:ok, term_condition} ->
        term_condition |> Eshop.Conditions.update_term_condition(term_condition_params)
    end
  end

  def delete_term_condition(%{id: id}, _info) do
    case {:ok, Eshop.Conditions.get_term_condition!(id)} do
      {:ok, term_condition} -> term_condition |> Eshop.Conditions.delete_term_condition()
    end
  end
end
