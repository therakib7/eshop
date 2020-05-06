defmodule Eshop.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :is_active, :boolean, default: false, null: false
      add :name, :string
      add :native_name, :string
      add :desc, :text
      add :native_desc, :text
      add :views, :integer
      add :loves, :integer
      add :vat, :integer
      add :vat_type, :integer
      add :unit, :integer
      add :has_variant, :boolean, default: false, null: false
      add :has_package, :boolean, default: false, null: false
      add :total_order, :integer
      add :low_stock, :integer
      add :has_warehouse, :boolean, default: false, null: false
      add :cost_price, :decimal
      add :unit_price, :decimal
      add :sell_price, :decimal
      add :type, :integer
      add :type_id, :integer
      add :extra_fields, :map
      add :asin_id, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :shop_id, references(:shops, on_delete: :nothing)
      add :unit_type_id, references(:unit_types, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:user_id])
    create index(:items, [:shop_id])
    create index(:items, [:unit_type_id])
  end
end
