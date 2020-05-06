defmodule Eshop.Repo.Migrations.CreateShopPaymentMethods do
  use Ecto.Migration

  def change do
    create table(:shop_payment_methods) do
      add :is_active, :boolean, default: false, null: false
      add :ac_holder_name, :string
      add :ac_no, :integer
      add :account_type, :string
      add :shop_id, references(:shops, on_delete: :nothing)
      add :banking_provider_id, references(:banking_providers, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:shop_payment_methods, [:shop_id])
    create index(:shop_payment_methods, [:banking_provider_id])
    create index(:shop_payment_methods, [:user_id])
  end
end
