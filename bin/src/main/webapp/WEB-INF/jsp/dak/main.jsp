<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport">
	<title>솔루티온 뉴스레터</title>

    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="shortcut icon" href="data:image/x-icon;" type="image/x-icon">
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="resources/js/click.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>

    <script>
    jQuery(function($) {
        /* =============== SHOW / HIDE GO TO TOP =============== */
        /* Check to see if the window is top if not then display go top button */
        $(window).scroll(function(){
            if ($(this).scrollTop() > 200) {
                $('#scrollToTop').fadeIn();
            } else {
                $('#scrollToTop').fadeOut();
            }
        });
        /* Click event to scroll to top */
        $('#scrollToTop').click(function(){
            $('html, body').animate({scrollTop : 0},800);
            return false;
        });
    });
    </script>

    <script>
        $(document).ready(function(){ 
            $(".first-acate-top").click(function(){
                var submenua = $(".first-acate-open");
                submenua.css(":visible");
                submenua.slideDown();
            });
            $(".sec-acate-top").click(function(){
                var submenub = $(".sec-acate-open");
                submenub.css(":visible");
                submenub.slideDown();
            });
            $(".third-acate-top").click(function(){
                var submenuc = $(".third-acate-open");
                submenuc.css(":visible");
                submenuc.slideDown();
            });
            $(".four-acate-top").click(function(){
                var submenud = $(".four-acate-open");
                submenud.css(":visible");
                submenud.slideDown();
            });
            $(".five-acate-top").click(function(){
                var submenuf = $(".five-acate-open");
                submenuf.css(":visible");
                submenuf.slideDown();
            });
        });


    //   $( document ).ready( function() {
    //     $( '#bon' ).click( function() {
    //       $( '#showHideon' ).slideUp('medium');
    //     } );
    //   } );
    // $( '#aon' ).click( function() {
    //         $( '.showHideon' ).slideDown();
    //         } );
    //     } );

    </script>


</head>
<body>
	
<div id="wrap">

	<div id="header">
        <div class="header-top">
            <div class="container">
                <div class="date">2021년 8월 31일 화요일</div>
                <div class="logo"><img src="resources/img/logo.png"/></div>
            </div>
        </div>
        <div class="header-nav">
        	<div class="container"><h1>TREND LETTER</h1></div>
        </div>
    </div>





    <div class="contents">
            <div class="container">
                <h2>오늘의 검색어 Hot Issue</h2>
                <div class="line"></div>
                        
                <!-- <div class="main_content">
                    <div class="inner">main content 1</div>
                </div> -->
            </div>

        <div class="sub_top">
            <div class="sub_content">
                <div class="container_but">
                    <div class="button">무료 다운로드</div>
                    <div class="button">전체 다운로드</div>
                </div>
                <div class="container">
                    <div class="sub_inner per15">
                        <h5>카테고리</h5>
                        <button id="aon" class="cate-but"></button>
                        <ul id="showHideon" class="click">
                            <li id="bon" class="on first-acate-top">패션의류</li>
                            <li>패션잡화</li>
                            <li>화장품/미용</li>
                            <li> 디지털/가전</li>
                            <li> 가구/인테리어</li>
                            <li> 식품</li>
                            <li> 스포츠/레저</li>
                            <li> 출산/육아</li>
                            <li>생활/건강</li>
                        </ul>
                    </div>
                    <div class="sub_inner per15">
                        <h5>신규 인기검색어</h5>
                        <button id="atw" class="cate-but"></button>
                        <ul id="showHidetw" class="click sub-open-on first-acate-open">
                            <li>써스데이아일랜드원피스</li>
                            <li id="btw" class="on sec-acate-top">블라우스</li>
                            <li>여름원피스</li>
                            <li>쥬시쥬디</li>
                            <li>롱원피스</li>
                            <li>라코스테원피스</li>
                            <li>우비</li>
                            <li>여성점프수트</li>
                            <li>플라스틱아일랜드원피스</li>
                            <li>뷔스티에원피스</li>
                            <li>쥬시쥬디원피스</li>
                            <li>여름가디건</li>
                            <li>지컷원피스</li>
                            <li>린넨원피스</li>
                            <li>온앤온원피스</li>
                            <li>여성원피스</li>
                            <li>여성반바지</li>
                            <li>랩원피스</li>
                            <li>시슬리원피스</li>
                            <li>바스락원피스</li>                                
                        </ul>
                    </div>
                    <div class="sub_inner per15">
                        <h5>확장키워드</h5>
                        <button id="ath" class="cate-but"></button>
                        <ul id="showHideth" class="click sub-open-tw sec-acate-open">
                            <li>	블라우스	</li>
                            <li>	검정블라우스	</li>
                            <li>	남색블라우스	</li>
                            <li>	레드블라우스	</li>
                            <li>	레이스블라우스	</li>
                            <li>	로엠블라우스	</li>
                            <li>	루즈핏린넨블라우스	</li>
                            <li>	린넨셔츠자켓	</li>
                            <li>	베네통체크	</li>
                            <li>	보라색블라우스	</li>
                            <li>	블라우스셔츠	</li>
                            <li>	블라우스쇼핑몰	</li>
                            <li>	블랙블라우스	</li>
                            <li>	블루블라우스	</li>
                            <li>	빅카라블라우스	</li>
                            <li>	셔링블라우스	</li>
                            <li>	쉬폰블라우스	</li>
                            <li>	써스데이아일랜드데님	</li>
                            <li>	써스데이아일랜드블라우스	</li>
                            <li>	여름블라우스	</li>
                            <li>	여성남방	</li>
                            <li>	여성반팔블라우스	</li>
                            <li>	여성블라우스	</li>
                            <li>	여성상의	</li>
                            <li>	여성오피스룩	</li>
                            <li>	여성티블라우스	</li>
                            <li>	연말블라우스	</li>
                            <li>	옐로우블라우스	</li>
                            <li>	오렌지블라우스	</li>
                            <li>	온앤온	</li>
                            <li>	자수블라우스	</li>
                            <li>	자켓블라우스	</li>
                            <li>	지컷블라우스	</li>
                            <li>	초록블라우스	</li>
                            <li>	케네스레이디블라우스	</li>
                            <li>	퍼플블라우스	</li>
                            <li id="bth" class="on third-acate-top">	프릴블라우스	</li>
                            <li>	화이트블라우스	</li>
                            <li>	흰블라우스	</li>
                            <li>	분홍블라우스	</li>
                            <li>	녹색블라우스	</li>
                            <li>	가을블라우스	</li>
                            <li>	지이크블라우스	</li>
                            <li>	soup블라우스	</li>
                            <li>	베스띠벨리블라우스	</li>
                            <li>	SI블라우스	</li>
                            <li>	랩블라우스	</li>
                            <li>	헤지스블라우스	</li>
                            <li>	버버리블라우스	</li>
                            <li>	더틸버리블라우스	</li>                                                          
                        </ul>
                    </div>
                    <div class="sub_inner per30">
                        <h5>바로 보는 순위별 입찰가</h5>

                        <div id="showHideth" class="sub-open-th third-acate-open mb45" style="margin: 0 auto;">
                            <table class="tg">
                                <thead>
                                    <tr> <th class="th_inner" colspan="2">PC</th> </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="td_inner">
                                        <ul>
                                        <li>1위</li>
                                        <li>2위</li>
                                        <li>3위</li>
                                        <li>4위</li>
                                        <li>5위</li>
                                        <li>6위</li>
                                        <li>7위</li>
                                        <li>8위</li>
                                        <li>9위</li>
                                        <li>10위</li>
                                        </ul>
                                    </td>
                                    <td class="td_inner">
                                        <ul>
                                        <li>2,960원</li>
                                        <li>1,900원</li>
                                        <li>1,550원</li>
                                        <li>1,330원</li>
                                        <li>1,130원</li>
                                        <li>1,040원</li>
                                        <li>990원</li>
                                        <li>950원</li>
                                        <li>910원</li>
                                        <li>880원</li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            
                            <table class="tg">
                                <thead>
                                    <tr> <th class="th_inner" colspan="2">Mobile</th> </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="td_inner">
                                        <ul>
                                        <li>1위</li>
                                        <li>2위</li>
                                        <li>3위</li>
                                        <li>4위</li>
                                        <li>5위</li>
                                        </ul>
                                    </td>
                                    <td class="td_inner">
                                        <ul>
                                        <li>1,810원</li>
                                        <li>1,330원</li>
                                        <li>1,170원</li>
                                        <li>70원</li>
                                        <li>70원</li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>





        <div class="contents">
                <div class="container">
                    <h2>나의 검색어 인사이트</h2>
                    <div class="line"></div>
                            
                    <!-- <div class="main_content">
                        <div class="inner">main content 2</div>
                    </div> -->
                </div>

        <div class="sub_bottom">
            <div class="sub_content">
                <div class="container_but">
                    <div class="guide">검색어 인사이트</div>
                    <div class="speech_balloon"><input class="keyword" type="text" name="search" maxlength="25" value="" placeholder="검색어를 입력하세요"/></div>
                    <div class="button fw four-acate-top">분석하기</div>
                </div>
                <div class="container sec">

                    <div class="per30">
                        <div class="sub_inner flex heig">
                            <h5>키워드 경쟁력</h5>
                           
                            <div class="sub-open-fo four-acate-open" style="margin: 0 auto;">
                            <table class="tg" style="width: 100%; text-align: left;">
                                <tbody>
                                <tr>
                                    <td class="td_inner">
                                        <ul>
                                            <li>월별검색수(PC)</li>
                                            <li>월별검색수(MO)</li>
                                            <li>월평균클릭수(PC)</li>
                                            <li>월평균클릭수(MO)</li>
                                            <li>월평균클릭률(%)(PC)</li>
                                            <li>월평균클릭률(%)(MO)</li>
                                            <li>월평균노출광고수(PC)</li>
                                        </ul>
                                    </td>
                                    <td class="td_inner">
                                        <ul>
                                            <li>8,500 회</li> 
                                            <li>91,600 회</li> 
                                            <li>69 회</li> 
                                            <li>973 회</li> 
                                            <li>0.9 %</li> 
                                            <li>1.2 %</li> 
                                            <li>15 개</li>       
                                        </ul>
                                    </td>
                                    <!-- <td class="td_inner count">
                                        <ul>
                                            <li>회</li>
                                            <li>회</li>
                                            <li>회</li>
                                            <li>회</li>
                                            <li>%</li>
                                            <li>%</li>
                                            <li>개</li>
                                        </ul>
                                    </td> -->
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        </div>

                        <div class="sub_inner flex">
                            <h5>최근 6개월 키워드 검색량</h5>

                            <div class="sub-open-fo four-acate-open" style="width:100%;">
                                <canvas id="chart" height="250"></canvas>
                                </div>
                             
                        </div>
                    </div>
                    
                    <div class="per20">
                        <div class="sub_inner flex">
                            <h5>확장키워드</h5>
                            <button id="afo" class="cate-but"></button>
                            <ul id="showHidefo" class="click sub-open-fo four-acate-open">
                                <li>	블라우스	</li>
                                <li>	검정블라우스	</li>
                                <li>	남색블라우스	</li>
                                <li>	레드블라우스	</li>
                                <li id="bfo" class="on five-acate-top">	레이스블라우스	</li>
                                <li>	로엠블라우스	</li>
                                <li>	루즈핏린넨블라우스	</li>
                                <li>	린넨셔츠자켓	</li>
                                <li>	베네통체크	</li>
                                <li>	보라색블라우스	</li>
                                <li>	블라우스셔츠	</li>
                                <li>	블라우스쇼핑몰	</li>
                                <li>	블랙블라우스	</li>
                                <li>	블루블라우스	</li>
                                <li>	빅카라블라우스	</li>
                                <li>	셔링블라우스	</li>
                                <li>	쉬폰블라우스	</li>
                                <li>	써스데이아일랜드데님	</li>
                                <li>	써스데이아일랜드블라우스	</li>
                                <li>	여름블라우스	</li>
                                <li>	여성남방	</li>
                                <li>	여성반팔블라우스	</li>
                                <li>	여성블라우스	</li>
                                <li>	여성상의	</li>
                                <li>	여성오피스룩	</li>
                                <li>	여성티블라우스	</li>
                                <li>	연말블라우스	</li>
                                <li>	옐로우블라우스	</li>
                                <li>	오렌지블라우스	</li>
                                <li>	온앤온	</li>
                                <li>	자수블라우스	</li>
                                <li>	자켓블라우스	</li>
                                <li>	지컷블라우스	</li>
                                <li>	초록블라우스	</li>
                                <li>	케네스레이디블라우스	</li>
                                <li>	퍼플블라우스	</li>
                                <li>	프릴블라우스	</li>
                                <li>	화이트블라우스	</li>
                                <li>	흰블라우스	</li>
                                <li>	분홍블라우스	</li>
                                <li>	녹색블라우스	</li>
                                <li>	가을블라우스	</li>
                                <li>	지이크블라우스	</li>
                                <li>	soup블라우스	</li>
                                <li>	베스띠벨리블라우스	</li>
                                <li>	SI블라우스	</li>
                                <li>	랩블라우스	</li>
                                <li>	헤지스블라우스	</li>
                                <li>	버버리블라우스	</li>
                                <li>	더틸버리블라우스	</li>  
                            </ul>
                        </div>
                    </div>

                    <div class="per40">
                        <div class="sub_inner flex">
                        <h5>바로 보는 순위별 입찰가</h5>
 
                            <div class="sub-open-fi five-acate-open mb45" style="margin: 0 auto;">
                                <table class="tg">
                                    <thead>
                                        <tr> <th class="th_inner" colspan="2">PC</th> </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="td_inner">
                                            <ul>
                                                <li>1위</li>
                                                <li>2위</li>
                                                <li>3위</li>
                                                <li>4위</li>
                                                <li>5위</li>
                                                <li>6위</li>
                                                <li>7위</li>
                                                <li>8위</li>
                                                <li>9위</li>
                                                <li>10위</li>
                                            </ul>
                                        </td>
                                        <td class="td_inner">
                                            <ul>
                                                <li>2,960원</li>
                                                <li>1,900원</li>
                                                <li>1,550원</li>
                                                <li>1,330원</li>
                                                <li>1,130원</li>
                                                <li>1,040원</li>
                                                <li>990원</li>
                                                <li>950원</li>
                                                <li>910원</li>
                                                <li>880원</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                
                                <table class="tg">
                                    <thead>
                                        <tr> <th class="th_inner" colspan="2">Mobile</th> </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="td_inner">
                                            <ul>
                                            <li>1위</li>
                                            <li>2위</li>
                                            <li>3위</li>
                                            <li>4위</li>
                                            <li>5위</li>
                                            </ul>
                                        </td>
                                        <td class="td_inner">
                                            <ul>
                                            <li>1,810원</li>
                                            <li>1,330원</li>
                                            <li>1,170원</li>
                                            <li>70원</li>
                                            <li>70원</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>


                    </div>
                </div>
            </div>
        </div>

        
        </div>


        <div class="contents">
            <div id="share">
                <div class="container">
                    <h3 class="pc">Tip 1.<br>공유하고 더 슬기로운 마케터 되기</h3>
                    <h3 class="m">Tip 1.<br>공유하고 더 슬기로운<br>마케터 되기</h3>
                    <ul class="share_but">
                        <li><img src="resources/img/kakaotalk.png"/></li>
                        <li><img src="resources/img/facebook.png"/></li>
                        <li><img src="resources/img/instagram.png"/></li>
                        <li><img src="resources/img/blog.png"/></li>
                        <li><img src="resources/img/twitter.png"/></li>
                    </ul>
                </div>
            </div>
        </div> 

    	<div id="footer">

            <div class="footer-top pd30">
                <div class="container">
                    <h3>Tip 2.<br>구독하고 더 많은 인사이트 얻기</h3>
                    
                    <div class="subscribe_inner">
                    <div class="guide">수신 메일 주소</div>
                    <div class="subscribe_email"><input class="keyword" type="text" name="subscribe" value="" placeholder="메일 주소를 입력하세요"/></div>
                    <div class="subscribe_but" onclick="test()">구독하기</div>
                    </div>
                    
                </div>
            </div>

            <div id="footer-info">
                <div class="container">
                    <div class="logo"><img src="resources/img/logo_w.png"/></div>
                    <p>
                    본 메일은 주식회사 솔루티온에서 정보 및 홍보성 컨텐츠로 발송한 메일입니다. <br/>
                    메일 수신을 원치 않으시면 <span class="unsubscribe">수신거부</span>를 클릭하십시오. <br/>
                    If you don't want to receive this mail anymore, click here unsubscription <br/>
                    서울시 송파구 법원로11길 7, C동 413호 (문정현대지식산업센터)  Tel. 02 407 0601  |  Fax. 02 407 0602 <br/>
                    COPYRIGHTS SOLU-TION. ALL RIGHTS RESERVED. <br/>
                    
                    </p>
                </div>
            </div>	
        </div>

</div>

<a href="#" id="scrollToTop">Go to Top</a>

</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>

<script>
    // Code goes here
var ctx = document.getElementById('chart').getContext('2d');
new Chart(ctx, {
type: 'line',
data: {
labels: ['2021-08', '2021-07', '2021-06', '2021-05', '2021-04', '2021-03'],
datasets: [{
label: 'PC',
yAxisID: 'A',
borderColor: '#678184',
backgroundColor: 'white',
data: [8040, 9660 , 12000 , 10800 , 12800 , 12300],
fill: false
}, {
label: 'Mobile',
yAxisID: 'D',
borderColor: '#2faebb',
backgroundColor: 'white',
data: [80400 , 106100 , 129700 , 124100 , 131100 , 136000 ],
fill: false
}]
},
options: {
tooltips: {
mode: 'nearest'
},
scales: {
yAxes: [{
id: 'A',
type: 'linear',
position: 'left',
ticks: {
min: 5000,
max: 15000,
stepSize: 2000,
fontColor: '#678184',
callback: function(value, index, values) {
return value;
}
}
}, {
id: 'D',
type: 'linear',
position: 'right',
ticks: {
min: 50000,
max: 150000,
stepSize: 20000,
fontColor: '#2faebb',
callback: function(value, index, values) {
return value;
}
},
scaleLabel: {
display: false
},
}]
},
elements: {
line: {
tension: 0, // disables bezier curves
},
point: {
radius: 4,
borderWidth: 2,
pointStyle: 'circle'
}
}
}
});

$('li').on('click', function() {
  $(this).prependTo($(this).parent())
  $(this).parent().animate({
    scrollTop: 0
  })
})
 
</script>

