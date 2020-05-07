defmodule EshopWeb.Schema do
    use Absinthe.Schema
    import_types Absinthe.Type.Custom

    import_types(__MODULE__.Types.{
        User,
        UserProfile,
        Role,
        UserRole,
        LoginDetail,

    })

    import_types(__MODULE__.Queries.{
        User,
        UserProfile,
        Role,
        UserRole,
        LoginDetail,
    })

    import_types(__MODULE__.Mutations.{
        User
    })

    query do
        import_fields(:user_queries)
        import_fields(:user_profile_queries)
        import_fields(:role_queries)
        import_fields(:user_role_queries)
        import_fields(:login_detail_queries)
#

    end 

    mutation do
        import_fields(:user_mutations)
    end
end