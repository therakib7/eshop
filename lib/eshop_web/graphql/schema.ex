defmodule EshopWeb.Schema do
    use Absinthe.Schema

    import_types(__MODULE__.Types.{
        Eshop
    })

    import_types(__MODULE__.Queries.{
        Eshop
    })

    import_types(__MODULE__.Mutations.{
        Eshop
    })

    query do
        import_fields(:user_queries)
    end 

    mutation do
        import_fields(:user_mutations)
    end
end