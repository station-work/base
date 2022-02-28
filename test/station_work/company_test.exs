defmodule StationWork.CompanyTest do
  use StationWork.DataCase

  alias StationWork.Company

  describe "companies" do
    alias StationWork.Company.Companies

    import StationWork.CompanyFixtures

    @invalid_attrs %{image: nil, name: nil, web_site: nil}

    test "list_companies/0 returns all companies" do
      companies = companies_fixture()
      assert Company.list_companies() == [companies]
    end

    test "get_companies!/1 returns the companies with given id" do
      companies = companies_fixture()
      assert Company.get_companies!(companies.id) == companies
    end

    test "create_companies/1 with valid data creates a companies" do
      valid_attrs = %{image: "some image", name: "some name", web_site: "some web_site"}

      assert {:ok, %Companies{} = companies} = Company.create_companies(valid_attrs)
      assert companies.image == "some image"
      assert companies.name == "some name"
      assert companies.web_site == "some web_site"
    end

    test "create_companies/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_companies(@invalid_attrs)
    end

    test "update_companies/2 with valid data updates the companies" do
      companies = companies_fixture()
      update_attrs = %{image: "some updated image", name: "some updated name", web_site: "some updated web_site"}

      assert {:ok, %Companies{} = companies} = Company.update_companies(companies, update_attrs)
      assert companies.image == "some updated image"
      assert companies.name == "some updated name"
      assert companies.web_site == "some updated web_site"
    end

    test "update_companies/2 with invalid data returns error changeset" do
      companies = companies_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_companies(companies, @invalid_attrs)
      assert companies == Company.get_companies!(companies.id)
    end

    test "delete_companies/1 deletes the companies" do
      companies = companies_fixture()
      assert {:ok, %Companies{}} = Company.delete_companies(companies)
      assert_raise Ecto.NoResultsError, fn -> Company.get_companies!(companies.id) end
    end

    test "change_companies/1 returns a companies changeset" do
      companies = companies_fixture()
      assert %Ecto.Changeset{} = Company.change_companies(companies)
    end
  end
end
