module IconHelper
  # SVG paths for common icons
  ICON_PATHS = {
    'plus' => "M12 6v6m0 0v6m0-6h6m-6 0H6",
    'arrow-left' => "M10 19l-7-7m0 0l7-7m-7 7h18",
    'arrow-right' => "M14 5l7 7m0 0l-7 7m7-7H3",
    'check' => "M5 13l4 4L19 7",
    'trash' => "M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16",
    'edit' => "M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z",
    'times' => "M6 18L18 6M6 6l12 12"
  }

  # Renders just an SVG icon without text
  def svg_icon(icon_name, options = {})
    path = ICON_PATHS[icon_name] || ""
    svg_class = options.fetch(:class, "inline-block h-4 w-4")

    content_tag(:svg,
      content_tag(:path, nil, stroke_linecap: "round", stroke_linejoin: "round", d: path),
      class: svg_class,
      fill: "none",
      stroke: "currentColor",
      viewBox: "0 0 24 24",
      "stroke-width" => "2"
    )
  end

  # Renders an SVG icon with optional text that can be hidden on smaller screens
  def svg_icon_with_text(icon_name, options = {})
    text = options.delete(:text)
    right = options.fetch(:right, true)
    svg_class = options.fetch(:svg_class, "inline-block h-4 w-4 #{right ? 'mr-1' : 'ml-1'}")
    text_class = options.fetch(:text_class, "md:inline hidden")

    svg = svg_icon(icon_name, class: svg_class)
    text_span = text.present? ? content_tag(:span, text, class: text_class) : ""

    if right
      text_span + svg
    else
      svg + text_span
    end
  end
end
