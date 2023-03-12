--11円以上の出金のあった行をすべて削除する
DELETE FROM 家計簿 WHERE 出金額 > 10

--正しいNULLの判定方法
SELECT *
  FROM 家計簿
 WHERE 出金額 IS NULL

--10月に関連する行を取得するSELECT文
SELECT * FROM 家計簿
 WHERE メモ LIKE '%10月%'

--1,000~5,000円の出費を取得するSELECT文  
SELECT *
  FROM 家計簿
 WHERE 出金額 BETWEEN 1000 AND 5000

--食費・交際費を取得するSELECT文 
SELECT *
  FROM 家計簿
 WHERE 費目 IN ('食費', '交際費')
 
--食費でも交際費でもない行を取得するSELECT文
SELECT *
  FROM 家計簿
 WHERE 費目 NOT IN ('食費', '交際費')

--2つの条件式を組み合わせたWHERE句
UPDATE 買い物リスト
   SET 価格 = 6500
 WHERE 名称 = 'スッキリ勇者クエスト'
   AND 販売店 = 'B'

--複数の論理演算子を使ったSELECT文  
SELECT * FROM 買い物リスト
 WHERE 販売店 = 'A'        /* 条件式1 */
    OR 販売店 = 'B'        /* 条件式2 */
   AND カテゴリ = 'ゲーム'  /* 条件式3 */
    OR カテゴリ = 'DVD'    /* 条件式4 */

--論理演算子の優先順位を指定する
SELECT * FROM 買い物リスト
 WHERE ( 販売店 = 'A'          /* 条件式1 */
    OR   販売店 = 'B')         /* 条件式2 */
   AND ( カテゴリ = 'ゲーム'    /* 条件式3 */
    OR   カテゴリ = 'DVD')     /* 条件式4 */


--特定社員を削除する  
DELETE FROM 社員
 WHERE 社員番号 = '2003032'  /* 社員番号で対象行を特定*/


-- 3月10日に払った食費の内容を知りたい
SELECT * FROM 家計簿
 WHERE 日付 = '2022-03-10' AND 費目 = '食費';

-- 支出に関係のない行を取り出したい
SELECT * FROM 家計簿
 WHERE 出金額 IS NULL;

-- メモに「購入」を含む支払いを調べたい
SELECT * FROM 家計簿
 WHERE メモ LIKE '%購入%' AND 出金額 > 0;

-- 住居費（家賃、電気代、水道代）の支払いを調べたい
SELECT * FROM 家計簿
 WHERE 費目 IN ('家賃','電気代','水道代');

-- 4月の行だけを取り出したい
SELECT * FROM 家計簿
 WHERE 日付 BETWEEN '2022-04-01' AND '2022-04-30';


 -- 1
SELECT * FROM 気象観測 WHERE 月 = 6;
-- 2
SELECT * FROM 気象観測 WHERE 月 <> 6;
-- 3
SELECT * FROM 気象観測 WHERE 降水量 < 100;
-- 4
SELECT * FROM 気象観測 WHERE 降水量 > 200;
-- 5
SELECT * FROM 気象観測 WHERE 最高気温 >= 30;
-- 6
SELECT * FROM 気象観測 WHERE 最低気温 <= 0;
-- 7 INを使う場合
SELECT * FROM 気象観測 WHERE 月 IN (3, 5, 7);
-- 7 ORを使う場合
SELECT * FROM 気象観測
 WHERE 月 = 3 OR 月 = 5 OR 月 = 7;
-- 8 NOT INを使う場合
SELECT * FROM 気象観測 WHERE 月 NOT IN (3, 5, 7);
-- 8 ANDを使う場合
SELECT * FROM 気象観測
 WHERE 月 <> 3 AND 月 <> 5 AND 月 <> 7;
-- 9
SELECT * FROM 気象観測
 WHERE 降水量 <= 100 AND 湿度 < 50;
-- 10
SELECT * FROM 気象観測
 WHERE 最低気温 < 5 OR 最高気温 > 35;
-- 11 BETWEENを使う場合
SELECT * FROM 気象観測
 WHERE 湿度 BETWEEN 60 AND 79;
-- 11 ANDを使う場合
SELECT * FROM 気象観測
 WHERE 湿度 >= 60 AND 湿度 <= 79;
-- 12
SELECT * FROM 気象観測
 WHERE 降水量 IS NULL OR 最高気温 IS NULL
    OR 最低気温 IS NULL OR 湿度 IS NULL;



-- 1
SELECT 都道府県名 FROM 都道府県
 WHERE 都道府県名 LIKE '%川';
-- 2
SELECT 都道府県名 FROM 都道府県
 WHERE 都道府県名 LIKE '%島%';
-- 3
SELECT 都道府県名 FROM 都道府県
 WHERE 都道府県名 LIKE '愛%';
-- 4
SELECT * FROM 都道府県
 WHERE 都道府県名 = 県庁所在地;
-- 5
SELECT * FROM 都道府県
 WHERE 都道府県名 <> 県庁所在地;


-- 1
SELECT * FROM 成績表;
-- 2
/* 学籍番号S001の学生 */
INSERT INTO 成績表
VALUES ('S001', '織田　信長', 77, 55, 80, 75, 93, NULL);
/* 学籍番号A002の学生 */
INSERT INTO 成績表
VALUES ('A002', '豊臣　秀吉', 64, 69, 70, 0, 59, NULL);
/* 学籍番号E003の学生 */
INSERT INTO 成績表
VALUES ('E003', '徳川　家康', 80, 83, 85, 90, 79, NULL);
-- 3
UPDATE 成績表 SET 法学 = 85, 哲学 = 67
 WHERE 学籍番号 = 'S001';
-- 4
UPDATE 成績表 SET 外国語 = 81
 WHERE 学籍番号 IN ('A002', 'E003');
-- 5
/* (1) */
UPDATE 成績表 SET 総合成績 = 'A'
 WHERE 法学 >= 80 AND 経済学 >= 80 AND 哲学 >= 80
   AND 情報理論 >= 80 AND 外国語 >= 80;
/* (2) */
UPDATE 成績表 SET 総合成績 = 'B'
 WHERE (法学 >= 80 OR 外国語 >= 80)
   AND (経済学 >= 80 OR 哲学 >= 80)
   AND 総合成績 IS NULL;
/* (3) */
UPDATE 成績表 SET 総合成績 = 'D'
 WHERE 法学 < 50 AND 経済学 < 50 AND 哲学 < 50
   AND 情報理論 < 50 AND 外国語 < 50
   AND 総合成績 IS NULL;
/* (4) */
UPDATE 成績表 SET 総合成績 = 'C'
 WHERE 総合成績 IS NULL;
-- 6
DELETE FROM 成績表
 WHERE 法学 = 0
    OR 経済学 = 0
    OR 哲学 = 0
    OR 情報理論 = 0
    OR 外国語 = 0;


/*
1.WHERE句は、SELECT、UPDATE、DELETE文で使える。
2.WHERE句は、記述した条件式によって、データの絞り込みができる。
3.条件式で、「真」となるデータが処理の対象となる。
4.条件式には、様々な演算子が記述できる。
5.比較演算子
=、<、>、 <=、 >=、 <>、IS NULL、LIKE、BETWEEN、IN、ANY、ALL
6.論理演算子
AND、OR、NOT
7.論理演算子の優先順位
NOT、AND、ORの順で優先度が高く、先に評価される。
8.NULLとは？値が不明、または無意味である為、データが格納されてない状態
9.NULL判定には、IS NULLとIS NOT NULL をしよう
=NULLでは、正しく判定できない。
10.主キーによって、

*/