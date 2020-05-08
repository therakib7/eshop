defmodule EshopWeb.Schema do
    use Absinthe.Schema
    import_types Absinthe.Type.Custom

    import_types(__MODULE__.Types.{
        # Users
        User,
        UserProfile,
        Role,
        UserRole,
        LoginDetail,

        # Geo
        CountryStage,
        Location,

        # Settings
        Setting,
        UserSetting,
        CompanySetting,

        # Companies
        Company,
        Shop,
        Warehouse,
        WarehouseVariant,
        WarehouseVariantValue

        # Attachments
        Attachment,
        Gallery,
        
        # Conditions
        TermCondition,
        PrivacyPolicy,
        Guarantee,
        RefundPolicy,

        # Components
        Category,
        Brand,
        Variant,
        VariantValue,
        Faq,
        DiscountCode,
        Package,
        PackageItem,

        # Objects
        Item,
        Product,

        # Activities
        TypeComment,
        Rating,
        
        # Messengers
        ChatRoom,
        ChatMsg,
        NotificationMsg,
        Notification,

        # Payments
        BankingProvider,
        ShopPaymentMethod,

        # Orders
        Invoice,
        InvoiceItem,
        InvoiceItemVariant,

        # Shippments
        ShippingMethod,
        ShopShippingMethod,
        ShippingAddress,
        TrackingInvoice,        

    })

    import_types(__MODULE__.Queries.{
        # Users
        User,
        UserProfile,
        Role,
        UserRole,
        LoginDetail,

        # Geo
        # Settings
        # Companies
        # Attachments
        # Conditions
        # Components
        # Objects
        # Activities
        # Messengers
        # Payments
        # Orders
        # Shippments 
    })

    import_types(__MODULE__.Mutations.{
        # Users
        # Geo
        # Settings
        # Companies
        # Attachments
        # Conditions
        # Components
        # Objects
        # Activities
        # Messengers
        # Payments
        # Orders
        # Shippments
        User
    })

    query do
        # Users
        import_fields(:user_queries)
        import_fields(:user_profile_queries)
        import_fields(:role_queries)
        import_fields(:user_role_queries)
        import_fields(:login_detail_queries)

        # Geo
        # Settings
        # Companies
        # Attachments
        # Conditions
        # Components
        # Objects
        # Activities
        # Messengers
        # Payments
        # Orders
        # Shippments 
    end 

    mutation do
        # Users
        import_fields(:user_mutations)

        # Geo
        # Settings
        # Companies
        # Attachments
        # Conditions
        # Components
        # Objects
        # Activities
        # Messengers
        # Payments
        # Orders
        # Shippments 
    end
end