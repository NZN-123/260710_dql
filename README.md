# 🎓 RDBMS DQL 핵심 학습 로드맵 (MySQL 기준)

본 저장소는 관계형 데이터베이스(RDBMS)의 조회 언어인 **DQL(Data Query Language)**을 밑바닥부터 심화 연산까지 체계적으로 학습하기 위한 가이드라인을 제공합니다. 

각 학습 파일은 **초심자를 위한 직관적 비유**, **주니어를 위한 아키텍처 및 튜닝 원리**, **SQLD 자격증 시험 핵심 이론**, 그리고 **기술 면접 예상 질문 리스트**를 포함하고 있습니다.

---

## 🗺️ 학습 로드맵 요약

| 단계 (File Link) | 핵심 학습 범위 | RDBMS 물리 원리 & 튜닝 포인트 | SQLD 출제 핵심 포인트 |
| :--- | :--- | :--- | :--- |
| **[Step 1: DQL 기초](file:///Users/jjn_22/IdeaProjects/260710_dql/step1.md)** | `SELECT`, `FROM`, `WHERE`<br>Alias(`AS`), `DISTINCT`<br>논리 연산자(`AND`, `OR`, `NOT`) | 쿼리 파서 & 옵티마이저 아키텍처<br>논리적 실행 순서 (`FROM` ➡️ `WHERE` ➡️ `SELECT`) | SELECT 별칭의 WHERE 절 사용 불가 원인<br>3치 논리(3-Valued Logic)와 NULL 비교 |
| **[Step 2: 조건 & 정렬](file:///Users/jjn_22/IdeaProjects/260710_dql/step2.md)** | `BETWEEN AND`, `IN`<br>`LIKE`(와일드카드 `%`, `_`)<br>`ORDER BY`, `LIMIT / OFFSET` | CPU 정렬 연산(**Filesort**) vs **Index Scan**<br>대용량 오프셋 페이징의 한계와 No-Offset 튜닝 | `NOT IN` 내 NULL 존재 시 공집합 오류<br>DBMS 제품별 NULL의 정렬 순서 크기 판정 차이<br>`LIKE` 접두사 인덱스 매칭 구조 |
| **[Step 3: 조인 & 함수](file:///Users/jjn_22/IdeaProjects/260710_dql/step3.md)** | `IS [NOT] NULL`<br>`IFNULL`, `COALESCE`<br>Implicit 조인(콤마 조인)<br>단일 행 문자열 함수 | **Nested Loop Join** 작동 원리<br>조인 키 인덱스가 조인 루프 속도에 미치는 영향<br>중첩 함수(Nested Function) 평가 순서 | DBMS별 NULL 대체 함수 비교 (`NVL` vs `IFNULL` 등)<br>조인 조건 누락 시 카티션 곱(Cross Join) 방지법<br>MySQL `||` 연산자의 논리 OR 동작 원리 |
| **[Step 4: 분기 & 집계](file:///Users/jjn_22/IdeaProjects/260710_dql/step4.md)** | 검색형/단순형 `CASE` 식<br>`IF` 함수 (MySQL 전용)<br>집계 함수(`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`) | CASE 단락 평가(Short-circuit)<br>집계 연산의 임시 메모리 버퍼링 구조 | CASE 식 `ELSE` 누락 시 NULL 리턴 주의<br>집계 함수의 **NULL 자동 배제(Ignore)** 공식<br>조건 불일치(공집합) 시 `SUM`(`NULL`) vs `COUNT`(`0`) |
| **[DQL 01: 그룹핑 & HAVING](file:///Users/jjn_22/IdeaProjects/260710_dql/dql01.md)** | `GROUP BY` 절<br>`HAVING` 절<br>집계 함수 연동 그룹화 | 임시 테이블 & 해시 그룹 집계 알고리즘<br>MySQL 8.0 묵시적 정렬 폐지 및 최적화 흐름 | GROUP BY 사용 시 SELECT 컬럼 명시 제한<br>WHERE vs HAVING 차이와 조기 필터링 기법 |

---

## 🎯 프로그래머스 SQL 실전 문제 적용 Kit (MySQL 기준)

현재까지 학습한 범위(**기초 조회, 정렬, 조건 필터링, NULL 제어, 조인 기초, 단일 행 함수, 집계 함수, 그룹핑**) 내에서 해결할 수 있는 프로그래머스의 대표적인 실전 연습 문제입니다.

### 1. SELECT & 정렬 관련 문제
* **[여러 기준으로 정렬하기](https://school.programmers.co.kr/learn/courses/30/lessons/59404)**
  * **연계 학습**: `step2.md` (ORDER BY 다중 조건 정렬)
  * **핵심 팁**: `ORDER BY NAME ASC, DATETIME DESC`처럼 오름차순과 내림차순을 조합하여 다중 정렬을 수행합니다.
* **[상위 n개 레코드](https://school.programmers.co.kr/learn/courses/30/lessons/59405)**
  * **연계 학습**: `step2.md` (LIMIT 페이징)
  * **핵심 팁**: 정렬한 다음 가장 상위의 1개 로우만 잘라내기 위해 `LIMIT 1` 구조를 적용합니다.

### 2. 조건 필터링 & 문자열 내장 함수 관련 문제
* **[강원도에 위치한 생산공장 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131112)**
  * **연계 학습**: `step2.md` (LIKE), `step3.md` (IFNULL / COALESCE)
  * **핵심 팁**: 주소가 강원도인 공장을 거르기 위해 `WHERE ADDRESS LIKE '강원도%'`를 사용하고, 전화번호가 없는 공장의 전화번호는 `COALESCE`나 `IFNULL`을 사용해 `'공동'`으로 치환합니다.
* **[3월에 태어난 여성 회원 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131120)**
  * **연계 학습**: `step2.md` (LIKE), `step3.md` (IS NOT NULL)
  * **핵심 팁**: 생일에서 월 정보를 잘라내기 위해 날짜 내장 함수 또는 문자열 매칭(`LIKE '%-03-%'`)을 활용하고, 전화번호가 NULL인 회원을 제외하기 위해 `AND TLNO IS NOT NULL` 필터를 적용합니다.

### 3. NULL 제어 및 대체 함수 관련 문제
* **[NULL 처리하기](https://school.programmers.co.kr/learn/courses/30/lessons/59410)**
  * **연계 학습**: `step3.md` (IFNULL / COALESCE)
  * **핵심 팁**: 동물의 이름(`NAME`)이 없을 때만 `'No name'`으로 변경해 주는 `IFNULL(NAME, 'No name')` 혹은 `COALESCE(NAME, 'No name')` 단일 행 함수를 적용합니다.

### 4. 수량/중복 제거 및 집계 관련 문제
* **[중복 제거하기](https://school.programmers.co.kr/learn/courses/30/lessons/59408)**
  * **연계 학습**: `step1.md` (DISTINCT), `step4.md` (COUNT)
  * **핵심 팁**: 이름 컬럼에서 중복을 먼저 없앤 고유 리스트를 카운팅하기 위해 `COUNT(DISTINCT NAME)` 구조를 활용합니다. 집계 함수는 NULL 값을 자동으로 배제하므로 추가 필터를 작성할 필요가 없습니다.

### 5. 테이블 조인 기초 관련 문제
* **[조건에 부합하는 중고거래 댓글 조회하기](https://school.programmers.co.kr/learn/courses/30/lessons/164671)**
  * **연계 학습**: `step3.md` (Implicit Join / Nested Loop Join)
  * **핵심 팁**: 게시글 테이블(Board)과 댓글 테이블(Reply)을 조인 키(`BOARD_ID`)를 통해 병합하여 2022년 10월에 작성된 데이터를 필터링합니다.

### 6. GROUP BY & HAVING 관련 문제 (신규)
* **[고양이와 개는 몇 마리 있을까](https://school.programmers.co.kr/learn/courses/30/lessons/59040)**
  * **연계 학습**: `dql01.md` (GROUP BY)
  * **핵심 팁**: `GROUP BY ANIMAL_TYPE ORDER BY ANIMAL_TYPE`을 적용해 동물 종류별 마릿수를 카운팅하고 가나다순으로 정렬합니다.
* **[동명 동물 수 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59041)**
  * **연계 학습**: `dql01.md` (HAVING)
  * **핵심 팁**: 이름별로 그룹화한 뒤, 2회 이상 출현한 이름만 필터링하기 위해 `HAVING COUNT(NAME) >= 2`를 기술하고 이름순으로 정렬합니다.

---

## 💡 종합 핵심 원리 다시보기

1. **RDBMS는 순서대로 평가한다**: 쿼리 작성 시 항상 머릿속으로 `FROM` ➡️ `WHERE` ➡️ `GROUP BY` ➡️ `HAVING` ➡️ `SELECT` ➡️ `ORDER BY` ➡️ `LIMIT` 순으로 메모리 블록이 적재되고 평가되는 것을 의식해야 구문 오류를 방지할 수 있습니다.
2. **GROUP BY 이후 SELECT는 제약된다**: 그룹핑이 수행되는 즉시 개별 레코드가 합쳐지므로, GROUP BY 조건에 없는 일반 컬럼은 반드시 집계 함수(`AVG`, `SUM` 등)로 감싸서 조회해야 무결성 에러가 발생하지 않습니다.
3. **조기 필터링(WHERE)을 지향하자**: 그룹 결과에 대한 조건은 HAVING에 넣어야 하지만, 그룹화하기 전 개별 행에 대해 필터링할 수 있는 조건은 반드시 WHERE 절에 명시하여 정렬 메모리 및 CPU 비용을 아껴야 합니다.
4. **NULL은 값을 비교하지 못한다**: `NULL`은 정의되지 않은 미지의 값이므로 `=`이나 `!=` 대신 반드시 `IS NULL`, `IS NOT NULL`로만 존재 여부를 비교해야 3치 논리의 모순에 빠지지 않습니다.