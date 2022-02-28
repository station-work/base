defmodule StationWorkWeb.CompaniesControllerTest do
  use StationWorkWeb.ConnCase

  import StationWork.CompanyFixtures

  @create_attrs %{image: "some image", name: "some name", web_site: "some web_site"}
  @update_attrs %{image: "some updated image", name: "some updated name", web_site: "some updated web_site"}
  @invalid_attrs %{image: nil, name: nil, web_site: nil}

  describe "index" do
    test "lists all companies", %{conn: conn} do
      conn = get(conn, Routes.companies_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Companies"
    end
  end

  describe "new companies" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.companies_path(conn, :new))
      assert html_response(conn, 200) =~ "New Companies"
    end
  end

  describe "create companies" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.companies_path(conn, :create), companies: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.companies_path(conn, :show, id)

      conn = get(conn, Routes.companies_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Companies"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.companies_path(conn, :create), companies: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Companies"
    end
  end

  describe "edit companies" do
    setup [:create_companies]

    test "renders form for editing chosen companies", %{conn: conn, companies: companies} do
      conn = get(conn, Routes.companies_path(conn, :edit, companies))
      assert html_response(conn, 200) =~ "Edit Companies"
    end
  end

  describe "update companies" do
    setup [:create_companies]

    test "redirects when data is valid", %{conn: conn, companies: companies} do
      conn = put(conn, Routes.companies_path(conn, :update, companies), companies: @update_attrs)
      assert redirected_to(conn) == Routes.companies_path(conn, :show, companies)

      conn = get(conn, Routes.companies_path(conn, :show, companies))
      assert html_response(conn, 200) =~ "some updated image"
    end

    test "renders errors when data is invalid", %{conn: conn, companies: companies} do
      conn = put(conn, Routes.companies_path(conn, :update, companies), companies: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Companies"
    end
  end

  describe "delete companies" do
    setup [:create_companies]

    test "deletes chosen companies", %{conn: conn, companies: companies} do
      conn = delete(conn, Routes.companies_path(conn, :delete, companies))
      assert redirected_to(conn) == Routes.companies_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.companies_path(conn, :show, companies))
      end
    end
  end

  defp create_companies(_) do
    companies = companies_fixture()
    %{companies: companies}
  end
end
