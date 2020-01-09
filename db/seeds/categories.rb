categorirs = %w(manuel comic CD/DVD software hardware goods)
categorirs.each do |c|
    Category.create(
        category_name: "#{c}"
    )
end
