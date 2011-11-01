module ApplicationHelper
  def header_menu(items)
    content_tag(:ul, :id => "primary_menu") do
      raw(
      items.map do |item|
        content_tag(:li, :class => 'top_menu_item') do
          link_to item[0], item[1]
        end
      end.join('')
      )
    end
  end

end
