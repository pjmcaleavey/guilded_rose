def update_quality(items)
  items.each do |item|
   quality_decrease(item)
    else
      if item.quality < 50
      quality_increase(item)
        
    end
    if item.name != 'Sulfuras, Hand of Ragnaros'
      item.sell_in -= 1
    end
       if item.sell_in < 0
        quality_decrease(item)
        else
          item.quality = item.quality - item.quality
        end
      else
       quality_increase(item)
      end
    end
  end#do loop
end#method

def quality_increase(item)
   item.quality += 1
    if item.name == 'Backstage passes to a TAFKAL80ETC concert'
         item.quality += 1 if item.sell_in < 11
         item.quality += 1 if item.sell_in < 6
    end 
end

def quality_decrease(item)
  exclusive_items = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert',  'Sulfuras, Hand of Ragnaros']
  item.quality -= 1 if (!exclusive_items.include? item) && (item.quality > 0)
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

