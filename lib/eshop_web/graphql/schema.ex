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
        WarehouseVariantValue,

        # Attachments
        Attachment,
        Gallery,
        
        # Conditions
        TermCondition,
        Guarantee,
        PrivacyPolicy,
        RefundPolicy,

        # Components
        Category,
        Brand,
        Variant,
        VariantValue,
        Package,
        PackageItem,
        Faq,
        DiscountCode,

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
        WarehouseVariantValue,

        # Attachments
        Attachment,
        Gallery,
        
        # Conditions
        TermCondition,
        Guarantee,
        PrivacyPolicy,
        RefundPolicy,

        # Components
        Category,
        Brand,
        Variant,
        VariantValue,
        Package,
        PackageItem,
        Faq,
        DiscountCode,

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
        import_fields(:country_stage_queries)
        import_fields(:location_queries)
        
        # Settings
        import_fields(:setting_queries)
        import_fields(:user_setting_queries)
        import_fields(:company_setting_queries)

        # Companies
        import_fields(:company_queries)
        import_fields(:shop_queries)
        import_fields(:warehouse_queries)
        import_fields(:warehouse_variant_queries)
        import_fields(:warehouse_variant_value_queries)
        
        # Attachments
        import_fields(:attachment_queries)
        import_fields(:gallery_queries)
        
        # Conditions
        import_fields(:term_condition_queries)
        import_fields(:guarantee_queries)
        import_fields(:privacy_policy_queries)
        import_fields(:refund_policy_queries)
        
        # Components
        import_fields(:category_queries)
        import_fields(:brand_queries)
        import_fields(:variant_queries)
        import_fields(:variant_value_queries)
        import_fields(:package_queries)
        import_fields(:package_item_queries)
        import_fields(:faq_queries)
        import_fields(:discount_code_queries)
        
        # Objects
        import_fields(:item_queries)
        import_fields(:product_queries)
        
        # Activities
        import_fields(:type_comment_queries)
        import_fields(:rating_queries)
        
        # Messengers
        import_fields(:chat_room_queries)
        import_fields(:chat_msg_queries)
        import_fields(:notification_msg_queries)
        import_fields(:notification_queries)
        
        # Payments
        import_fields(:banking_provider_queries)
        import_fields(:shop_payment_method_queries)
        
        # Orders
        import_fields(:invoice_queries)
        import_fields(:invoice_item_queries)
        import_fields(:invoice_item_variant_queries)
        
        # Shippments 
        import_fields(:shipping_method_queries)
        import_fields(:shop_shipping_method_queries)
        import_fields(:shipping_address_queries)
        import_fields(:tracking_invoice_queries)

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