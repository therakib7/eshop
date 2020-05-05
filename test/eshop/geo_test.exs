defmodule Eshop.GeoTest do
  use Eshop.DataCase

  alias Eshop.Geo

  describe "country_stages" do
    alias Eshop.Geo.CountryStage

    @valid_attrs %{country_id: 42, name: "some name", native_name: "some native_name", stage: 42, user_id: 42}
    @update_attrs %{country_id: 43, name: "some updated name", native_name: "some updated native_name", stage: 43, user_id: 43}
    @invalid_attrs %{country_id: nil, name: nil, native_name: nil, stage: nil, user_id: nil}

    def country_stage_fixture(attrs \\ %{}) do
      {:ok, country_stage} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_country_stage()

      country_stage
    end

    test "list_country_stages/0 returns all country_stages" do
      country_stage = country_stage_fixture()
      assert Geo.list_country_stages() == [country_stage]
    end

    test "get_country_stage!/1 returns the country_stage with given id" do
      country_stage = country_stage_fixture()
      assert Geo.get_country_stage!(country_stage.id) == country_stage
    end

    test "create_country_stage/1 with valid data creates a country_stage" do
      assert {:ok, %CountryStage{} = country_stage} = Geo.create_country_stage(@valid_attrs)
      assert country_stage.country_id == 42
      assert country_stage.name == "some name"
      assert country_stage.native_name == "some native_name"
      assert country_stage.stage == 42
      assert country_stage.user_id == 42
    end

    test "create_country_stage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_country_stage(@invalid_attrs)
    end

    test "update_country_stage/2 with valid data updates the country_stage" do
      country_stage = country_stage_fixture()
      assert {:ok, %CountryStage{} = country_stage} = Geo.update_country_stage(country_stage, @update_attrs)
      assert country_stage.country_id == 43
      assert country_stage.name == "some updated name"
      assert country_stage.native_name == "some updated native_name"
      assert country_stage.stage == 43
      assert country_stage.user_id == 43
    end

    test "update_country_stage/2 with invalid data returns error changeset" do
      country_stage = country_stage_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_country_stage(country_stage, @invalid_attrs)
      assert country_stage == Geo.get_country_stage!(country_stage.id)
    end

    test "delete_country_stage/1 deletes the country_stage" do
      country_stage = country_stage_fixture()
      assert {:ok, %CountryStage{}} = Geo.delete_country_stage(country_stage)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_country_stage!(country_stage.id) end
    end

    test "change_country_stage/1 returns a country_stage changeset" do
      country_stage = country_stage_fixture()
      assert %Ecto.Changeset{} = Geo.change_country_stage(country_stage)
    end
  end

  describe "locations" do
    alias Eshop.Geo.Location

    @valid_attrs %{code: "some code", country_id: 42, is_active: true, lat: 120.5, long: 120.5, name: "some name", native_name: "some native_name", order: 42, parent_id: 42, stage_id: 42, user_id: 42, web: "some web"}
    @update_attrs %{code: "some updated code", country_id: 43, is_active: false, lat: 456.7, long: 456.7, name: "some updated name", native_name: "some updated native_name", order: 43, parent_id: 43, stage_id: 43, user_id: 43, web: "some updated web"}
    @invalid_attrs %{code: nil, country_id: nil, is_active: nil, lat: nil, long: nil, name: nil, native_name: nil, order: nil, parent_id: nil, stage_id: nil, user_id: nil, web: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Geo.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Geo.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Geo.create_location(@valid_attrs)
      assert location.code == "some code"
      assert location.country_id == 42
      assert location.is_active == true
      assert location.lat == 120.5
      assert location.long == 120.5
      assert location.name == "some name"
      assert location.native_name == "some native_name"
      assert location.order == 42
      assert location.parent_id == 42
      assert location.stage_id == 42
      assert location.user_id == 42
      assert location.web == "some web"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Geo.update_location(location, @update_attrs)
      assert location.code == "some updated code"
      assert location.country_id == 43
      assert location.is_active == false
      assert location.lat == 456.7
      assert location.long == 456.7
      assert location.name == "some updated name"
      assert location.native_name == "some updated native_name"
      assert location.order == 43
      assert location.parent_id == 43
      assert location.stage_id == 43
      assert location.user_id == 43
      assert location.web == "some updated web"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_location(location, @invalid_attrs)
      assert location == Geo.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Geo.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Geo.change_location(location)
    end
  end
end
