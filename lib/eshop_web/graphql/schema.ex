defmodule EshopWeb.Schema do
    use Absinthe.Schema

    # import_types(__MODULE__.Types.{
    #     Todo
    # })

    # import_types(__MODULE__.Queries.{
    #     Todo
    # })

    # import_types(__MODULE__.Mutations.{
    #     Todo
    # })

    query do
        # import_fields(:todo_queries)
    end 

    mutation do
        # import_fields(:todo_mutations)
    end
end