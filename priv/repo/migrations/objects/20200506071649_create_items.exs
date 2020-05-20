defmodule Eshop.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :is_online, :boolean, default: false, null: false
      add :is_active, :boolean, default: false, null: false
      add :title, :string, null: true, size: 255
      add :native_title, :string, null: true, size: 255
      add :desc, :text, null: true
      add :native_desc, :text, null: true
      add :views, :integer, null: true
      add :loves, :integer, null: true
      add :vat, :integer, null: true
      add :vat_type, :integer, null: true
      add :unit, :integer, null: true
      add :has_variant, :boolean, default: false, null: false
      add :has_package, :boolean, default: false, null: false
      add :total_order, :integer, null: true
      add :low_stock, :integer, null: true
      add :has_warehouse, :boolean, default: false, null: false
      add :cost_price, :decimal, null: true
      add :unit_price, :decimal, null: true
      add :sell_price, :decimal, null: true
      add :type, :integer, null: true
      add :type_id, :integer, null: true
      add :extra_fields, :map, null: true
      add :asin_id, :string, null: true
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
