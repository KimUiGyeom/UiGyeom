select distinct 도시 from 고객;

select 도시 from 고객;

select 23+5 as 더하기, 23-5 as 빼기, 23*5 as 곱하기, 23/5 as 실수나누기, 23 div 5 as 정수나누기, 23%5 as 나머지1, 23 mod 5 as 나머지2;

select 23>=5, 23<=5, 23>23, 23<23, 23=23, 23!=23, 23<>23;

select * from 고객 where 담당자직위<> '대표 이사';

select * from 고객 where 도시 = '부산광역시' and 마일리지 < 1000;

select 고객번호, 담당자명, 마일리지, 도시 from 고객 where 도시 = '부산광역시' union select 고객번호, 담당자명, 마일리지, 도시 from 고객 where 마일리지 < 1000 order by 1;

select 고객번호, 담당자명, 마일리지, 도시 from 고객 where 도시 = '부산광역시' or 마일리지 < 1000 order by 1;

SELECT * FROM 고객 WHERE 지역 IS NULL;

SELECT * FROM 고객 WHERE 지역 ='';

UPDATE 고객 SET 지역 = NULL WHERE 지역 = '';

select * from 고객 where 지역 is null;

select 고객번호, 담당자명, 담당자직위 from 고객 where 담당자직위='영업 과장' or 담당자직위='마케팅 과장';

select 고객번호, 담당자명, 담당자직위 from 고객 where 담당자직위 in('영업 과장', '마케팅 과장');

select 담당자명, 마일리지 from 고객 where 마일리지 >= 100000 and 마일리지 <= 200000;

select 담당자명, 마일리지 from 고객 where 마일리지 between 100000 and 200000;

select * from 고객 where 도시 like '%광역시' and (고객번호 like '_C%' or 고객번호 like '__c%');

select * from 고객 where 고객회사명 regexp '푸드';

select * from 고객 where regexp_like(고객회사명, '푸드');



select * from 고객 where 도시='서울특별시' and 마일리지 between 15000 and 20000;

select distinct 지역, 도시 from 고객 order by 지역, 도시;

select * from 고객 where 도시 regexp '춘천시|과천시|광명시' and 담당자직위 regexp '이사|사원';

select * from 고객 where 도시 not like '%광역시' and 도시 not like '%특별시' order by 마일리지 desc limit 3;

select * from 고객 where 지역 is not null and 담당자직위 <> '대표 이사';


select char_length('HELLO'), length('HELLO'), char_length('안녕'), length('안녕');

select concat('DREAMS', 'COME', 'TRUE'), CONCAT_WS('-', '2023', '01', '29');

select left('sql 완전정복', 3), right('sql 완전정복', 4), substr('sql 완전정복', 2, 5), substr('sql 완전정복', 2);

select substring_index('서울시 동작구 흑석로', ' ', 2), substring_index('서울시 동작구 흑석로', ' ', -2);

select lpad('sql', 10, '#'), rpad('sql', 5, '*');

select length(ltrim(' sql ')), length(rtrim(' sql ')), length(trim(' sql '));

select trim(both 'abc' from 'abcSQLabcabc'), trim(leading 'abc' from 'abcsqlabcabc'), trim(trailing 'abc' from 'abcsqlabcabc');

select field('java', 'sql', 'java', 'c'), find_in_set('java', 'sql,java,c'), instr('네 인생을 살아라', '인생'), locate('인생', '네 인생을 살아라');

select elt(2, 'sql', 'java', 'c');

select repeat('*', 5);

select replace('010.1234.5678', '.', '-');

select reverse('olleh');

select ceiling(123.56), floor(123.56), round(123.56), round(123.56, 1), truncate(123.56, 1);

select abs(-120), abs(120), sign(-120), sign(120);

select mod(203, 4), 203%4, 203 mod 4;

select power(2, 3), sqrt(16), rand(), rand(100), round(rand()*100);

select now(), sysdate(), curdate(), curtime();

select now(), year(now()), quarter(now()), month(now()), day(now()), hour(now()), minute(now()), second(now());

select now(), datediff('2025-12-20', now()), datediff(now(),'2025-12-20'), timestampdiff(year, now(), '2025-12-20'),timestampdiff(month, now(), '2025-12-20'), timestampdiff(day, now(), '2025-12-20');

select now(), adddate(now(), 50), adddate(now(), interval 50 day), adddate(now(), interval 50 month), adddate(now(), interval 50 hour);

select now(), last_day(now()), dayofyear(now()), monthname(now()), weekday(now());

select cast('1' as unsigned), cast(2 as char(1)), convert('1', unsigned), convert(2, char(1));

select if(12500*450 > 5000000, '초과 달성', '미달성');

select ifnull(1, 0), ifnull(null, 0), ifnull(1/0, 'ok');

select nullif(12*10, 120), nullif(12*10, 1200);


select 
	고객회사명, 
	concat('**', substr(고객회사명, 3)) as 고객회사명2,
    전화번호,
    replace(replace(전화번호, '(', ''), ')', '-') as 전화번호2
    from 고객;

select
    *,
    truncate(주문수량*단가, -1) as 주문금액,
    truncate(주문수량*단가*할인율, -1) as 할인금액,
    truncate(주문수량*단가-주문수량*단가*할인율, -1) as 실주문금액
	from 주문세부;

select
	이름, 생일, 입사일,
    timestampdiff(year, 생일, now()) as 만나이,
    timestampdiff(day, 입사일, now()) as 입사일수,
    adddate(입사일, interval 500 day) as 500일후
    from 사원;

select
	담당자명, 고객회사명, 도시,
    if(도시 like '%특별시' or 도시 like '%광역시', '대도시', '도시') as 도시구분,
    마일리지,
	case when 마일리지>=100000 then 'VVIP고객' 
		when 마일리지>=10000 then 'VIP고객'
        else '일반고객'
        end as 마일리지구분
    from 고객;

select 주문번호, 고객번호, 주문일,
	year(주문일) as 주문년도,
    quarter(주문일) as 주문분기,
    month(주문일) as 주문월,
    day(주문일) as 주문일자,
    weekday(주문일) as 주문요일,
    case weekday(주문일) when 0 then '월요일' 
						when 1 then '화요일' 
						when 2 then '수요일' 
                        when 3 then '목요일' 
						when 4 then '금요일' 
						when 5 then '토요일' 
						when 6 then '일요일' 
						end as 한글요일
	from 주문;

select
	*, timestampdiff(day, 요청일, 발송일) as 지연일수 
    from 주문 
    where timestampdiff(day, 요청일, 발송일) >= 7;
    
    select count(*),
		count(고객번호),
        count(도시),
        count(지역)
        from 고객;
        
	select sum(마일리지),
		avg(마일리지),
        min(마일리지),
        max(마일리지)
        from 고객;
        
	select sum(마일리지),
		avg(마일리지),
        min(마일리지),
        max(마일리지)
        from 고객
        where 도시 = '서울특별시';
        
	select 
		도시,
		count(*) as 고객수,
        avg(마일리지) as 평균마일리지
        from 고객
        group by 도시;
    
    select
		담당자직위, 도시,
        count(*) as 고객수,
        avg(마일리지) as 평균마일리지
        from 고객
        group by 담당자직위, 도시
        order by 1, 2;
    
    select
		도시,
			count(*) as 고객수,
			avg(마일리지) as 평균마일리지
		from 고객
        group by 도시
        having count(*) >= 10;
    
    select 도시, sum(마일리지)
    from 고객
    where 고객번호 like 'T%'
    group by 도시
    having sum(마일리지) >=1000;
    
    select 
		도시, 
        count(*) as 고객수, 
        avg(마일리지) as 평균마일리지
    from 고객
    where 지역 is null
    group by 도시
    with rollup;
    
    select 
		ifnull(도시, '총계') as 도시,
        count(*) as 고객수, 
        avg(마일리지) as 평균마일리지
    from 고객
    where 지역 is null
    group by 도시
    with rollup;
    
    select
		담당자직위,
        도시,
        count(*) as 고객수
        from 고객
        where 담당자직위 like '%마케팅%'
        group by 담당자직위, 도시
        with rollup;
    
    select
		지역,
        count(*) as 고객수
        from 고객
        where 담당자직위 = '대표 이사'
        group by 지역
        with rollup;
        
	select
		지역,
        count(*) as 고객수,
        grouping(지역) as 구분
        from 고객
        where 담당자직위 = '대표 이사'
        group by 지역
        with rollup;
			
	select 
		group_concat(이름)
		from 사원;
    
    select 
		group_concat(distinct 지역)
		from 고객;
    
    select
		도시,
        group_concat(고객회사명) as 고객회사명목록
        from 고객
        group by 도시;
    
    /*1번*/
    select
		count(도시),
        count(distinct 도시)
		from 고객;
	
    /*2번*/
	select
        year(주문일) as 주문년도,
        count(*) as 주문건수
		from 주문
		group by 주문년도;
        
	/*3번*/
	select
		year(주문일) as 주문년도,
        quarter(주문일) as 분기,
        count(*) as 주문건수
		from 주문
        group by year(주문일), quarter(주문일)
        with rollup;
        
	/*4번*/
	select
		month(주문일) as 주문월,
        count(*) as 주문건수 
        from 주문
        where timestampdiff(day, 요청일, 발송일) > 0
		group by month(주문일)
        order by month(주문일);
		
	/*5번*/
	select
		제품명,
        sum(재고) as 재고합
        from 제품
        where 제품명 like '%아이스크림%'
        group by 제품명;
        
	/*6번*/
	select
		case when 마일리지>=50000 then 'VIP고객'
        else '일반고객' end as 고객구분,
		count(*) as 고객수,
        avg(마일리지) as 평균마일리지
		from 고객
		group by 고객구분;
   
   select 
		부서.부서번호,
		부서명,
        이름,
        사원.부서번호
        from 부서
        cross join 사원
        where 이름 = '배재용';
   
   select
		사원번호,
        직위,
        사원.부서번호,
        부서명
        from 사원
        inner join 부서
        on 사원.부서번호=부서.부서번호
        where 이름 = '이소미';
   
   select 
		고객.고객번호,
        담당자명,
        고객회사명,
        count(*) as 주문건수
        from 고객
        inner join 주문
        on 고객.고객번호=주문.고객번호
		group by 고객.고객번호,
			고객회사명
		order by count(*) desc;
   
   select 
		고객.고객번호,
        담당자명,
        고객회사명,
        sum(주문수량*단가) as 주문금액합
        from 고객
        inner join 주문
        on 고객.고객번호=주문.고객번호
        inner join 주문세부
        on 주문.주문번호=주문세부.주문번호
        group by 고객.고객번호,
				담당자명,
				고객회사명
		order by 4 desc;
        
	select
		고객번호,
        담당자명,
        마일리지,
        등급.*
        from 고객
        cross join 마일리지등급 as 등급
        where 담당자명='이은광';
        
        
	select
		고객번호,
        고객회사명,
        담당자명,
        마일리지,
        등급명
        from 고객
        inner join 마일리지등급
        on 마일리지 >= 하한마일리지
        and 마일리지 <= 상한마일리지
        where 담당자명 = '이은광';
        
        select
			사원번호,
			이름,
            부서명
            from 사원
            left outer join 부서
            on 사원.부서번호=부서.부서번호
            where 성별 = '여';
            
		select
			부서명,
            사원.*
            from 사원
            right outer join 부서
            on 사원.부서번호 = 부서.부서번호;
            
		select
			부서명,
            사원.*
            from 사원
            right outer join 부서
            on 사원.부서번호=부서.부서번호
            where 사원.부서번호 is null;
            
		select
			이름,
            부서.*
            from 사원
            left outer join 부서
            on 사원.부서번호 = 부서.부서번호
            where 부서.부서번호 is null;
            
		select
			사원.사원번호,
            사원.이름,
            상사.사원번호 as '상사의 사원번호',
            상사.이름 as '상사의 이름'
            from 사원
            inner join 사원 as 상사
            on 사원.상사번호 = 상사.사원번호;
            
		select
			사원.이름 as 이름,
            사원.직위,
            상사.이름 as 상사이름
            from 사원 as 상사
            right outer join 사원
            on 사원.상사번호 = 상사.사원번호
            order by 상사이름;
            
		/*1번*/
		select
			제품명,
            sum(주문수량) as 주문수량합,
            sum(주문세부.단가*주문수량) as 주문금액합
            from 제품
            inner join 주문세부
            on 제품.제품번호 = 주문세부.제품번호
            group by 제품명;
            
		/*2번*/
        select
			year(주문일) as 주문년도,
            제품명,
            sum(주문수량) as 주문수량합
            from 제품
            inner join 주문세부
            on 제품.제품번호 = 주문세부.제품번호
            inner join 주문
            on 주문세부.주문번호 = 주문.주문번호
            where 제품명 like '%아이스크림%'
            group by 주문년도, 제품명;
            
        /*3번*/
		select
			제품명,
            sum(주문수량) as 주문수량합
            from 제품
            left outer join 주문세부
            on 제품.제품번호 = 주문세부.제품번호
            group by 제품명;
		
        /*4번*/
        select
			고객번호,
            고객회사명,
            담당자명,
            등급명,
            마일리지
            from 고객
            inner join 마일리지등급
            on 마일리지 >= 하한마일리지
            and 마일리지 <= 상한마일리지
            where 등급명 = 'A';
