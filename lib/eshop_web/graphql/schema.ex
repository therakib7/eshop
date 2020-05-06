defmodule EshopWeb.Schema do
    use Absinthe.Schema

    import_types(__MODULE__.Types.{
        User
    })

    import_types(__MODULE__.Queries.{
        User
    })

    import_types(__MODULE__.Mutations.{
        User
    })

    query do
        import_fields(:user_queries)
    end 

    mutation do
        import_fields(:user_mutations)
    end
end