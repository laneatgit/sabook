# encoding: utf-8

Subject.delete_all

########################
# 流動資産
########################
Subject.create!(name: '銀行口座',  level:1, subject_type: '0')
Subject.create!(name: 'お財布',  level:1, subject_type: '0')

########################
# 支出
########################
# 教養・教育
c = Subject.create!(name: '教養・教育', level:1, subject_type: 1)
Subject.create!(name:'書籍',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'新聞・雑誌',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'習いごと',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'塾',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他教養・教育',parent_subject:c, level:2, subject_type: 1)

#住宅
#家賃・地代   ローン返済   管理費・積立金 地震・火災保険 その他住宅 
c = Subject.create!(name: '住宅',  level:1, subject_type: 1)
Subject.create!(name:'家賃・地代',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'ローン返済',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'管理費・積立',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'地震・火災保険',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他住宅',parent_subject:c, level:2, subject_type: 1)


#水道・光熱費  
#電気代 ガス・灯油代  水道代 その他水道・光熱費
c = Subject.create!(name: '水道・光熱費', level:1, subject_type: 1)  
Subject.create!(name:'電気代',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'ガス・灯油代',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'水道代',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他水道・光熱費',parent_subject:c, level:2, subject_type: 1)


#通信費 
#携帯電話    インターネット 固定電話    放送視聴料   情報サービス  その他通信費  宅配便・運送 
c = Subject.create!(name: '通信費',  level:1, subject_type: 1)  
Subject.create!(name:'携帯電話',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'インターネット',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'固定電話',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'放送視聴料',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'情報サービス',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他通信費',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'宅配便・運送',parent_subject:c, level:2, subject_type: 1)


#自動車 
#自動車ローン  ガソリン    駐車場 車両  車検・整備   道路料金    その他自動車  自動車保険
c = Subject.create!(name: '自動車',  level:1, subject_type: 1) 
Subject.create!(name:'自動車ローン',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'ガソリン',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'駐車場',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'車両',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'車検・整備',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'道路料金',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他自動車',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'自動車保険',parent_subject:c, level:2, subject_type: 1)

#保険  
#生命保険    医療保険    その他保険
c = Subject.create!(name: '保険',  level:1, subject_type: 1) 
Subject.create!(name:'生命保険',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'医療保険',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他保険',parent_subject:c, level:2, subject_type: 1) 


#税・社会保障  
#所得税・住民税 年金保険料   健康保険    その他税・社会保障 
c = Subject.create!(name: '税・社会保障', level:1, subject_type: 1) 
Subject.create!(name:'所得税・住民税',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'年金保険料',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'健康保険',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'その他税・社会保障',parent_subject:c, level:2, subject_type: 1) 


#日用品 
#日用品 ドラッグストア おこづかい   ペット 子育て その他日用品  タバコ 
c = Subject.create!(name: '日用品',  level:1, subject_type: 1) 
Subject.create!(name:'日用品',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'ドラッグストア',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'おこづかい',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'ペット',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'子育て',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他日用品',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'タバコ',parent_subject:c, level:2, subject_type: 1) 

#食費  
#食料品 外食  カフェ その他食費   朝ご飯 昼ご飯 夜ご飯 
c = Subject.create!(name: '食費',  level:1, subject_type: 1) 
Subject.create!(name:'食料品',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'外食',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'カフェ',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'その他食費',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'朝ご飯',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'昼ご飯',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'夜ご飯',parent_subject:c, level:2, subject_type: 1) 

#趣味・娯楽   
#アウトドア   スポーツ    映画・音楽・ゲーム   本   旅行  秘密の趣味   その他趣味・娯楽 
c = Subject.create!(name: '趣味・娯楽',  level:1, subject_type: 1) 
Subject.create!(name:'アウトドア',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'スポーツ',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'映画・音楽・ゲーム',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'本',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'旅行',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'秘密の趣味',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'その他趣味・娯楽',parent_subject:c, level:2, subject_type: 1) 

#衣服・美容   
#衣服  クリーニング  美容院・理髪  化粧品 アクセサリー  その他衣服・美容    
c = Subject.create!(name: '衣服・美容',  level:1, subject_type: 1) 
Subject.create!(name:'衣服',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'クリーニング',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'美容院・理髪',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'化粧品',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'アクセサリー',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他衣服・美容',parent_subject:c, level:2, subject_type: 1) 


#健康・医療   
#フィットネス  ボディケア   医療費 薬   その他健康・医療  
c = Subject.create!(name: '健康・医療',  level:1, subject_type: 1) 
Subject.create!(name:'フィットネス',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'ボディケア',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'医療費',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'薬',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'その他健康・医療',parent_subject:c, level:2, subject_type: 1)


#交通費 
#その他交通費  電車  バス  飛行機 タクシー    
c = Subject.create!(name: '交通費',  level:1, subject_type: 1) 
Subject.create!(name:'その他交通費',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'電車',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'バス',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'飛行機',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'タクシー',parent_subject:c, level:2, subject_type: 1)

#交際費 
#飲み会 冠婚葬祭    プレゼント代  その他交際費 
c = Subject.create!(name: '交際費',  level:1, subject_type: 1) 
Subject.create!(name:'飲み会',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'冠婚葬祭',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'プレゼント代',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'その他交際費',parent_subject:c, level:2, subject_type: 1) 


#特別な支出   
#住宅・リフォーム    家具・家電   その他特別な支出
c = Subject.create!(name: '特別な支出',  level:1, subject_type: 1) 
Subject.create!(name:'住宅・リフォーム',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'家具・家電',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'その他特別な支出',parent_subject:c, level:2, subject_type: 1) 



#その他 
#雑費  仕送り 事業経費    事業原価    事業投資    寄付金 
c = Subject.create!(name: 'その他',  level:1, subject_type: 1) 
Subject.create!(name:'雑費',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'仕送り',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'事業経費',parent_subject:c, level:2, subject_type: 1) 
Subject.create!(name:'事業原価',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'事業投資',parent_subject:c, level:2, subject_type: 1)
Subject.create!(name:'寄付金',parent_subject:c, level:2, subject_type: 1) 

########################
# 支出
########################
#収入  給与  一時所得    事業・副業   年金  その他入金   配当所得    不動産所得  
c = Subject.create!(name: '収入',  level:1, subject_type: 2) 
Subject.create!(name:'給与',parent_subject:c, level:2, subject_type: 2)
Subject.create!(name:'一時所得',parent_subject:c, level:2, subject_type: 2)
Subject.create!(name:'事業・副業',parent_subject:c, level:2, subject_type: 2) 
Subject.create!(name:'年金',parent_subject:c, level:2, subject_type: 2)
Subject.create!(name:'その他入金',parent_subject:c, level:2, subject_type: 2)
Subject.create!(name:'配当所得',parent_subject:c, level:2, subject_type: 2) 
Subject.create!(name:'不動産所得',parent_subject:c, level:2, subject_type: 2) 

