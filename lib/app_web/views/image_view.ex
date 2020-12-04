defmodule AppWeb.ImageView do
  use AppWeb, :view
  alias AppWeb.ImageView

  def render("show.json", %{image: image}) do
    IO.inspect(image)
    %{data: render_one(image, ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{
      id: image.id,
      image: image.image,
      url: get_url(image.image.file_name)
    }
  end

  defp get_url(image) do
    IO.inspect(App.ImageUploader.url(image))
    App.ImageUploader.url(image)
  end
end
