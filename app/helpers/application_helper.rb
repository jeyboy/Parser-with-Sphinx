module ApplicationHelper
  def header_menu(items)
    content_tag(:ul, :id => "primary_menu") do
      raw(items.inject("") {|str, item| str+=content_tag(:li, :class => 'top_menu_item') { link_to item[0], item[1] }})
    end
  end
end
