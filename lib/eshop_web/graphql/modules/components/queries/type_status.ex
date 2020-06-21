defmodule EshopWeb.Schema.Queries.TypeStatus do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeStatus

  object :type_status_queries do
    @desc "Get all type_statuses"
    field :type_statuses, list_of(:type_status) do
      resolve(&TypeStatus.list_type_statuses/3)
    end

    @desc "Get a type_status by its id"
    field :type_status, :type_status do
      arg(:id, non_null(:id))
      resolve(&TypeStatus.get_type_status/3)
    end
  end
end
