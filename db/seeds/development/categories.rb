categorirs = %w(攻略本 攻略本以外の書籍 CD/DVD ゲームソフト ゲーム機本体 キャラクターグッズ その他)
categorirs.each do |c|
    Category.create(
        category_name: "#{c}"
    )
end
