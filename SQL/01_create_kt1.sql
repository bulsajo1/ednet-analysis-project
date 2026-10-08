-- KT1의 학생별 CSV 파일 전체를 하나의 테이블로 합친다.
-- 학생 번호는 파일 이름에만 있으므로, 파일 이름에서 뽑아 user_id로 맨 앞에 둔다.
-- 경로는 notebooks 폴더에서 실행하는 것을 기준으로 한다.
--
-- 다른 단계(KT2, KT3, KT4)에 쓸 때는 두 군데만 바꾼다.
--   1. 테이블 이름: kt1 -> kt2
--   2. 폴더 경로: ../data/KT1/*.csv -> ../data/KT2/*.csv
-- SELECT *로 모든 컬럼을 가져오므로 단계마다 컬럼이 달라도 나머지는 고칠 필요가 없다.
-- 두 군데 중 하나만 바꾸면 다른 단계의 데이터가 섞이므로 반드시 함께 바꾼다.

CREATE OR REPLACE TABLE kt1 AS
SELECT
    parse_filename(filename, true) AS user_id,
    * EXCLUDE (filename)
FROM read_csv('../data/KT1/*.csv', filename = true);