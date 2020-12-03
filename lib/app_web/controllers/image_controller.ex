defmodule AppWeb.ImageController do
  use AppWeb, :controller
  alias App.Images.Image
  alias App.Images

  def create(conn, %{"image" => image_params}) do
    with {:ok, %Image{} = image} <- Images.create_image(image_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.image_path(conn, :show, image))
      |> render("show.json", image: image)
    end
  end
end
