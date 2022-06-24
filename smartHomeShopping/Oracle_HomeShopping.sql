-- 회원정보 테이블 생성
create table member_tbl_02 (
  custno number(6),	-- 회원 번호
  custname varchar2(20),	-- 이름
  phone varchar2(13),	-- 연락처
  address varchar2(60),	-- 주소
  joindate date,		-- 등록일
  grade char(1), city char(2),	-- 등급, 거주지
  primary key(custno)	-- 기본키
);

	not null -- 반드시 데이터를 입력하세요.
	null -- 




-- 회원정보 테이블에 대한 시퀀스 추가
create sequence member_seq
start with 10001
increment by 1
minvalue 10001
cache 10;

-- 회원 정보 추가
insert into member_tbl_02 values(10001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values(10002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values(10003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
insert into member_tbl_02 values(10004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
insert into member_tbl_02 values(10005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into hyun.member_tbl_02 values(10006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60') ;

select * from member_tbl_02;

delete from MEMBER_TBL_02 where custno = 10047;

-- 회원 매출 정보 명세서
create table money_tbl_02 (
  custno number(6),    -- 고객번호
  salenol number(8),   -- 판매번호
  pcost number(8),     -- 단가
  amount number(4),    -- 수량
  price number(8),     -- 가격
  pcode varchar2(4),   -- 상품코드
  sdate date,          -- 판매일자
  primary key(custno, salenol));  --기본키
  
  
-- 매출 정보 추가
insert into hyun.money_tbl_02 values(10001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl_02 values(10001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_tbl_02 values(10001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_tbl_02 values(10002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl_02 values(10002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_tbl_02 values(10003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl_02 values(10004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into money_tbl_02 values(10004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_tbl_02 values(10004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_tbl_02 values(10004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select * from money_tbl_02;


-- 매출 정보와 회원 정보 JOIN
SELECT mb.custno, mb.custname, mb.grade, sum(mn.price) as total 
FROM member_tbl_02 mb 
JOIN money_tbl_02 mn on mb.custno = mn.custno 
group by (mb.custno, mb.custname, mb.grade) 
order by total desc;


---- 업무요건 ----
1.테이블(회원정보, 매출정보)생성
2.회원 정보 추가/수정/조회 기능
3.회원정보 시퀀스 생성
4.매출 정보 조회
5.회원정보 + 매출정보 조인 기능


-- 개발 해야 할 프로그램 목록 --------
1.DBConnection.jsp
2.header.jsp -- 상단
3.buttom.jsp -- 하단
4.css
5.index.jsp -- 회원정보 등록/추가
6.action.jsp -- 회원정보 추가등록 및 수정 구현
7.list.jsp -- 회원정보 목록 보기
8.money.jsp --매출정보 보기
9.update.jsp -- 회원 정보 수정






  