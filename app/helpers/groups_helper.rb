module GroupsHelper
  def total_amount_helper(entities)
    entities.reduce(0) { |sum, entity| sum + entity.amount }
  end
end
