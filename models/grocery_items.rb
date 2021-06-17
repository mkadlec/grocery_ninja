######################################
# Returns an array of grocery items
# based on inputted values
######################################
class GroceryItems
  def self.sorted_items(console_input)
    console_input.split(/\s*,\s*/).sort!
  end
end
