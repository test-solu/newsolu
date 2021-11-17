<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport">
	<title>솔루티온 뉴스레터</title>

    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="shortcut icon" href="data:image/x-icon;" type="image/x-icon">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
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
       // $(document).ready(function(){ 
        	//$("#bon_0").attr("class", "on first-acate-top");
        	
        	
           /*  $(".first-acate-top").click(function(){
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
            }); */
            /* $(".four-acate-top").click(function(){
                var submenud = $(".four-acate-open");
                submenud.css(":visible");
                submenud.slideDown();
            }); */
          /*   $(".five-acate-top").click(function(){
                var submenuf = $(".five-acate-open");
                submenuf.css(":visible");
                submenuf.slideDown();
            }); */
            
            //alert($(".first-acate-top").text());
        //	$("#bfo_0").trigger("click");
            
      //  });


    //   $( document ).ready( function() {
    //     $( '#bon' ).click( function() {
    //       $( '#showHideon' ).slideUp('medium');
    //     } );
    //   } );
    // $( '#aon' ).click( function() {
    //         $( '.showHideon' ).slideDown();
    //         } );
    //     } );
    
    /* =============== 클릭 이벤트 선택한 li 확인 하기 () =============== */
    function click_me(seq,end,f_seq){
    	for(var i = 0; i < end; i++){
    		$("#bon_"+i).attr("class", "");
    		if(i == seq){
    			$("#bon_"+seq).attr("class", "on first-acate-top");
    		}
    	}
    	$(window).resize(function(){ if (window.innerWidth < 1000) { 
    		if ($('#showHideon').is(":hidden")) {
        	    $('#showHideon').animate({"height": "400px"}, "medium");
          	 	$('#showHideon').removeClass("stop-scroll");
          	} else {
          	 	$('#showHideon').animate({"height": "40px"}, "medium");  
          	  	$('#showHideon').addClass("stop-scroll");
            }
    	 } else {  } }).resize();
    	$("#bon_"+seq).prependTo($("#bon_"+seq).parent())
    	$("#bon_"+seq).parent().animate({
    	    scrollTop: 0
    	})
    			click_t(f_seq);
    			
    }
    
    function click_t(seq){
    	var li_mem = "";
    	$.ajax({
    		type		:	"POST",
    		url			:	"/getNewBest",
    		data		:	{f_seq:seq},
    		dataType	:	"json",
    		success		:	function(data){
    			for(var i=0; i<data.length; i++){
    				li_mem	+=	"<li id='btw_"+i+"' onclick='getextended("+i+","+data.length+")' >" + data[i].keyword + "</li>"
    			}
    			$("#showHidetw").html(li_mem);
    		},error		:	function(e){
    			alert(e.statusText);
    		}
    	});
        var submenua = $(".first-acate-open");
        submenua.css(":visible");
        submenua.slideDown();	
    }
    function getextended(seq,end){
    	for(var i = 0; i < end; i++){
    		$("#btw_"+i).attr("class", "");
    		if(i == seq){
    			$("#btw_"+i).attr("class", "on sec-acate-top");
    		}
    	}
    	$(window).resize(function(){ if (window.innerWidth < 1000) { 
    		if ($('#showHidetw').is(":hidden")) {
          	 	$('#showHidetw').animate({"height": "400px"}, "medium");
           	  	$('#showHidetw').removeClass("stop-scroll");
        	} else {
            	$('#showHidetw').animate({"height": "40px"}, "medium");
            	$('#showHidetw').addClass("stop-scroll");
       		}
    	} else {  } }).resize();
    	$("#btw_"+seq).prependTo($("#btw_"+seq).parent())
    	$("#btw_"+seq).parent().animate({
    	    scrollTop: 0
    	})
    	click_extended($("#btw_"+seq).text());
    }
    
    function click_extended(nk){
    	var li_extended = "";
    	$.ajax({
    		type		:	"GET",
    		url			:	"/getExtended",
    		data		:	{keyword:nk},
    		dataType	:	"json",
    		success		:	function(data){
    			var keylist = data.keywordList;
    			for(var i=0; i<keylist.length; i++){
    				li_extended	+= "<li id='bth_"+i+"' onclick='getMyPrice("+i+","+keylist.length+")' >" + keylist[i].relKeyword + "</li>";
    			}
    			$("#showHideth").html(li_extended);
    			//console.log(li_extended);
    		},error		:	function(e){
    			alert(e.statusText);
    		}
    	});
    	var submenub = $(".sec-acate-open");
        submenub.css(":visible");
        submenub.slideDown();
    }
    
    function getMyPrice(seq,end){
    	
    	for(var i = 0; i < end; i++){
    		$("#bth_"+i).attr("class", "");
    		if(i == seq){
    			$("#bth_"+i).attr("class", "on third-acate-top");
    		}
    	}
    	$(window).resize(function(){ if (window.innerWidth < 1000) { 
    	 if ($('#showHideth').is(":hidden")) {
             $('#showHideth').animate({"height": "400px"}, "medium");
             $('#showHideth').removeClass("stop-scroll");
         } else {
             $('#showHideth').animate({"height": "40px"}, "medium");  
             $('#showHideth').addClass("stop-scroll");
         }
    	} else {  } }).resize();
    	$("#bth_"+seq).prependTo($("#bth_"+seq).parent())
    	$("#bth_"+seq).parent().animate({
    	    scrollTop: 0
    	})
    	click_myprice($("#bth_"+seq).text());
    }
    
    function click_myprice(mykey){
    	var my_price = "";
    	var my_price_m = "";
    	$.ajax({
    		type		:	"GET",
    		url			:	"/getMyprice",
    		data		:	{keyword:mykey},
    		dataType	:	"json",
    		success		:	function(data){
    			var pc_bi = data.pc.estimate;
    			var mo_bi = data.Mobile.estimate
    			for(var i=0; i<pc_bi.length; i++){
    				my_price	+= "<li>" + pc_bi[i].bid.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원</li>";
    			}
    			for(var j=0; j<mo_bi.length; j++){
    				my_price_m	+= "<li>" + mo_bi[j].bid.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원</li>";
    			}
    			$("#td_inner_prive").html(my_price);
    			$("#td_inner_mprice").html(my_price_m);
    		},error		:	function(e){
    			console.log(e.statusText);
    		}
    	});
    	var submenuc = $(".third-acate-open");
        submenuc.css(":visible");
        submenuc.slideDown();
    }
    

    </script>
    
    <!-- 채널톡 부분 -->
	<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "e8397ac3-2e2f-46eb-bcd2-0515df104ed8"
  });
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
                        	<c:forEach items="${cateList }" var="cate" varStatus="cnt">
                        		<li id="bon_${cnt.index}" onclick="click_me(${cnt.index},${cateList_leng },${cate.seq })" >${cate.categorynm }</li>
                        	</c:forEach>
                            <!-- <li id="bon" class="on first-acate-top">패션의류</li>
                            <li>패션잡화</li>
                            <li>화장품/미용</li>
                            <li> 디지털/가전</li>
                            <li> 가구/인테리어</li>
                            <li> 식품</li>
                            <li> 스포츠/레저</li>
                            <li> 출산/육아</li>
                            <li>생활/건강</li> -->
                        </ul>
                    </div>
                    <div class="sub_inner per15">
                        <h5>신규 인기검색어</h5>
                        <button id="atw" class="cate-but"></button>
                        <ul id="showHidetw" class="click sub-open-on first-acate-open">
                            <!-- <li>써스데이아일랜드원피스</li>
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
                            <li>바스락원피스</li> -->                                
                        </ul>
                    </div>
                    <div class="sub_inner per15">
                        <h5>확장키워드</h5>
                        <button id="ath" class="cate-but"></button>
                        <ul id="showHideth" class="click sub-open-tw sec-acate-open">
                                                                        
                        </ul>
                    </div>
                    <div class="sub_inner per30">
                        <h5>바로 보는 순위별 입찰가</h5>

                        <div id="showHideth_1" class="sub-open-th third-acate-open mb45" style="margin: 0 auto;">
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
                                        <ul id="td_inner_prive">
                                        <!-- <li>2,960원</li>
                                        <li>1,900원</li>
                                        <li>1,550원</li>
                                        <li>1,330원</li>
                                        <li>1,130원</li>
                                        <li>1,040원</li>
                                        <li>990원</li>
                                        <li>950원</li>
                                        <li>910원</li>
                                        <li>880원</li> -->
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
                                        <ul id="td_inner_mprice">
                                       <!--  <li>1,810원</li>
                                        <li>1,330원</li>
                                        <li>1,170원</li>
                                        <li>70원</li>
                                        <li>70원</li> -->
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
                    <div class="speech_balloon"><input class="keyword" id="check_mk" type="text" name="search" maxlength="25" placeholder="검색어를 입력하세요" onkeyup="enterkey()"/></div>
                    <div class="button fw four-acate-top" onclick="check_my_keyword()">분석하기</div>
                </div>
                <div class="container sec">
                	                    <div class="per20">
                        <div class="sub_inner flex">
                            <h5>확장키워드</h5>
                            <button id="afo" class="cate-but"></button>
                            <ul id="showHidefo" class="click sub-open-fo four-acate-open" >
          
                            </ul>
                        </div>
                    </div>

                    <div class="per40">
                        <div class="sub_inner flex">
                        <h5>바로 보는 순위별 입찰가</h5>
 
                            <div class="sub-open-fi sub-open-fo five-acate-open mb45" style="margin: 0 auto;">
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
                                            <ul id="td_inner_check">
                                             
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
                                            <ul id="td_inner_check_m">
                                           <!--  <li>1,810원</li>
                                            <li>1,330원</li>
                                            <li>1,170원</li>
                                            <li>70원</li>
                                            <li>70원</li> -->
                                            </ul>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>


                    </div>
                </div>
                    <div class="per30">
                        <div class="sub_inner flex heig">
                            <h5>키워드 경쟁력</h5>
                           
                            <div class="sub-open-fo six-acate-open" style="margin: 0 auto;">
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
                                        <ul id="qc_cnt">
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

                            <div class="sub-open-fo seven-acate-open" id="seven_chart" style="width:100%;">
                            <img id="15simg" src="resources/img/loading_alpha.png"/>
                                <canvas id='chart' height='250' ></canvas>
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
                    <div class="subscribe_email"><input class="keyword" type="text" name="subscribe" id="client_email" onkeyup="enterkey_email()" placeholder="메일 주소를 입력하세요"/></div>
                    <div class="subscribe_but" onclick="saveEmail()">구독하기</div>
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
