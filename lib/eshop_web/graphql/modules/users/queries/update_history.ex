defmodule EshopWeb.Schema.Queries.UpdateHistory do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UpdateHistory, as: UpdateHistory

  object :update_history_queries do
    @desc "Get all update_histories"
    field :update_histories, list_of(:update_history) do
      resolve(&UpdateHistory.list_update_histories/3)
    end

    @desc "Get a update_history by its id"
    field :update_history, :update_history do
      arg(:id, non_null(:id))
      resolve(&UpdateHistory.get_update_history/3)
    end
  end
end
