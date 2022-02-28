module TargetsHelper

  def sort_order(column, created_at)
  direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
  link_to created_at, { sort: column, direction: direction }
  end

end
