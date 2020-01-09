table_names = %w(users items categories)
table_names.each do |table_name|
    path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
    if File.exist?(path)
        puts "Creating #{table_name}..."
        require path
    else
        puts "#{table_name}.rb it not found"
    end
end