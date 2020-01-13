categorirs = %w(manuel comic CD/DVD software hardware goods)
date = %w(2019-11-01 2019-12-01 2020-01-01 2020-02-01)
0.upto(49) do |i|
    Item.create(
        category_id: (i % 6) + 1,
        item_name: "TestItem#{i+1}_#{categorirs[i%6]}", #通し番号_カテゴリ名
        item_details: "ホビーショップNS限定販売品です！",
        stock: 10,
        price: 300*(i+1),
        releace: "#{date[i%4]}"
    )
end