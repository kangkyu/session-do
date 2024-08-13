ActionView::Base.field_error_proc = proc do |html_tag, instance|
  mthd_name = instance.instance_variable_get("@method_name")
  feedback = content_tag :div, instance.object.errors[mthd_name].to_sentence, class: "invalid-feedback"

  content_tag :div, class: "mb-3" do
    html_tag.gsub("form-control mb-4", "form-control is-invalid").html_safe.concat feedback
  end
end
