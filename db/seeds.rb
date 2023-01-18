CATEGORIES = %w(Exercise  Education  Recipe)
CATEGORIES.each {|category| Category.create(title: category)}
