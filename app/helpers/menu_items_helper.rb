module MenuItemsHelper

  def is_popular?(item)
    if item.id == Order.most_popular.id
      content_tag(:span, 'Popular Item!', class: "tag is-primary is-light is-rounded is-normal")
    end
  end
end
