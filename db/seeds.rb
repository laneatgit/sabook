#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8

SubectCategory.delete_all
Subject.delete_all

SubjectCategory.create!(name: '教養・教育', subject_category_type: '支出')
SubjectCategory.create!(name: '住宅', subject_category_type: '支出')

#教養・教育    
#書籍  新聞・雑誌   習いごと    学費  塾   その他教養・教育        

#住宅
#家賃・地代   ローン返済   管理費・積立金 地震・火災保険 その他住宅           

#水道・光熱費  
#電気代 ガス・灯油代  水道代 その他水道・光熱費               

#通信費 
#携帯電話    インターネット 固定電話    放送視聴料   情報サービス  その他通信費  宅配便・運送  

#自動車 
#自動車ローン  ガソリン    駐車場 車両  車検・整備   道路料金    その他自動車  自動車保険

#保険  
#生命保険    医療保険    その他保険                   

#税・社会保障  
#所得税・住民税 年金保険料   健康保険    その他税・社会保障   

#現金・カード  
#ATM引き出し カード引き落とし    電子マネー   その他現金・カード               

#日用品 
#日用品 ドラッグストア おこづかい   ペット 子育て その他日用品  タバコ 

#食費  
#食料品 外食  カフェ その他食費   朝ご飯 昼ご飯 夜ご飯 

#趣味・娯楽   
#アウトドア   スポーツ    映画・音楽・ゲーム   本   旅行  秘密の趣味   その他趣味・娯楽    

#衣服・美容   
#衣服  クリーニング  美容院・理髪  化粧品 アクセサリー  その他衣服・美容        

#健康・医療   
#フィットネス  ボディケア   医療費 薬   その他健康・医療            

#交通費 
#その他交通費  電車  バス  飛行機 タクシー            

#交際費 
#飲み会 冠婚葬祭    プレゼント代  その他交際費              

#特別な支出   
#住宅・リフォーム    家具・家電   その他特別な支出                    

#その他 
#雑費  仕送り 事業経費    事業原価    事業投資    寄付金 

#収入  給与  一時所得    事業・副業   年金  その他入金   配当所得    不動産所得   

#Subject.create!(name: '交通費', subject_type: '支出', description: '交通費用')
# . . .
