		
	function enterkey(){
		var mk = $("#check_mk").val();
		if(window.event.keyCode == 13){
			if(mk.length == 0) {
				alert("검색어를 입력하세요");
				return;
			} else {
				check_my_keyword();
			}
		}
	}

	function check_my_keyword() {
		$(".sub-open-fo").hide();
		var mk = $("#check_mk").val();
		let_write_mykey(mk);
		
		$.ajax({
    		type		:	"GET",
    		url			:	"/check_my_keyword",
    		data		:	{keyword:mk},
    		dataType	:	"json",
    		success		:	function(data){
				make_key_Competitiveness(data);
    		},error		:	function(e){
    			alert(e.statusText);
    		}
    	});
	}
	
	function let_write_mykey(mk){
		var li_extended = "";
		var li_pc_cnt = "";
    	$.ajax({
    		type		:	"GET",
    		url			:	"/getExtended",
    		data		:	{keyword:mk},
    		dataType	:	"json",
    		success		:	function(data){
    			var keylist = data.keywordList;
    			li_pc_cnt += "<li>" + keylist[0].monthlyPcQcCnt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +" 회</li>";
    			li_pc_cnt += "<li>" + keylist[0].monthlyMobileQcCnt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 회</li>";
    			var monave_pc_clk = keylist[0].monthlyAvePcClkCnt;
    			li_pc_cnt += "<li>" + Math.round(monave_pc_clk).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +" 회</li>";
    			var monave_mo_clk = keylist[0].monthlyAveMobileClkCnt;
    			li_pc_cnt += "<li>" + Math.round(monave_mo_clk).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +" 회</li>";
    			var month_avepcctr = keylist[0].monthlyAvePcCtr;
    			li_pc_cnt += "<li>" + month_avepcctr.toFixed(1) + " %</li>";
    			var month_avemoctr = keylist[0].monthlyAveMobileCtr;
    			li_pc_cnt += "<li>" + month_avemoctr.toFixed(1) + " %</li>";
    			li_pc_cnt += "<li>" + keylist[0].plAvgDepth + " 개</li>";
    			$("#qc_cnt").html(li_pc_cnt);
    			for(var i=0; i<keylist.length; i++){
    				li_extended	+= "<li id='bfo_"+i+"' onclick='check_mk_extended("+i+","+keylist.length+")' >" + keylist[i].relKeyword + "</li>";
    			}
    			$("#showHidefo").html(li_extended);
    		},error		:	function(e){
    			alert(e.statusText);
    		}
    	});
    	var submenud = $(".four-acate-open");
        submenud.css(":visible");
        submenud.slideDown();
	//	make_key_Competitiveness(data);
	}
	
	function check_mk_extended(seq,end){
    	for(var i = 0; i < end; i++){
    		$("#bfo_"+i).attr("class", "");
    		if(i == seq){
    			$("#bfo_"+i).attr("class", "on five-acate-top");
    		}
    	}
    	$(window).resize(function(){ if (window.innerWidth < 1000) { 
    		 if ($('#showHidefo').is(":hidden")) {
         	     $('#showHidefo').animate({"height": "400px"}, "medium");
      		     $('#showHideth').removeClass("stop-scroll");
     	    } else {
     	         $('#showHidefo').animate({"height": "40px"}, "medium");
     	         $('#showHidefo').addClass("stop-scroll");
      		}
        } else {  } }).resize();
        $("#bfo_"+seq).prependTo($("#bfo_"+seq).parent())
    	$("#bfo_"+seq).parent().animate({
    	    scrollTop: 0
    	})
    	check_mk_price($("#bfo_"+seq).text());
    }
	
	function check_mk_price(mykey){
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
    			$("#td_inner_check").html(my_price);
    			$("#td_inner_check_m").html(my_price_m);
    		},error		:	function(e){
    			console.log(" error >>>>> "+e.statusText);
    		}
    	});
    	var submenuf = $(".five-acate-open");
        submenuf.css(":visible");
        submenuf.slideDown();
    }
    
    function make_key_Competitiveness(data){
		var my_key = data[0];
		//console.log(my_key);
		var ctx = document.getElementById('chart').getContext('2d');
		var label = [];
		var d_pc = [];
		var data_mb = [];
		var min_p = 0;
		var max_p = 0;
		var ave_p = 0;
		
		var min_m = 0;
		var max_m = 0;
		var ave_m = 0;
		
		//날짜 입력
		label[0] = data[0].month_1;
		label[1] = data[0].month_2;
		label[2] = data[0].month_3;
		label[3] = data[0].month_4;
		label[4] = data[0].month_5;
		label[5] = data[0].month_6;
		label[6] = data[0].month_7;
		label[7] = data[0].month_8;
		label[8] = data[0].month_9;
		label[9] = data[0].month_10;
		label[10] = data[0].month_11;
		label[11] = data[0].month_12;
		label[12] = data[0].month_13;
		
		//pc 금액
		d_pc[0] = data[0].schCntPC_1;
		d_pc[1] = data[0].schCntPC_2;
		d_pc[2] = data[0].schCntPC_3;
		d_pc[3] = data[0].schCntPC_4;
		d_pc[4] = data[0].schCntPC_5;
		d_pc[5] = data[0].schCntPC_6;
		d_pc[6] = data[0].schCntPC_7;
		d_pc[7] = data[0].schCntPC_8;
		d_pc[8] = data[0].schCntPC_9;
		d_pc[9] = data[0].schCntPC_10;
		d_pc[10] = data[0].schCntPC_11;
		d_pc[11] = data[0].schCntPC_12;
		d_pc[12] = data[0].schCntPC_13;
		
		min_p = check_min(d_pc);
		max_p = check_max(d_pc);
		ave_p = check_ave(d_pc);
		
		//mobile
		data_mb[0] = data[0].schCntMO_1;
		data_mb[1] = data[0].schCntMO_2;
		data_mb[2] = data[0].schCntMO_3;
		data_mb[3] = data[0].schCntMO_4;
		data_mb[4] = data[0].schCntMO_5;
		data_mb[5] = data[0].schCntMO_6;
		data_mb[6] = data[0].schCntMO_7;
		data_mb[7] = data[0].schCntMO_8;
		data_mb[8] = data[0].schCntMO_9;
		data_mb[9] = data[0].schCntMO_10;
		data_mb[10] = data[0].schCntMO_11;
		data_mb[11] = data[0].schCntMO_12;
		data_mb[12] = data[0].schCntMO_13;
		
		min_m = check_min(data_mb);
		max_m = check_max(data_mb);
		ave_m = check_ave(data_mb);
		
	/*	console.log("min pc : " + min_p);
		console.log("max pc : " + max_p);
		console.log("ave pc : " + ave_p)
		
		console.log("min mobile : " + min_m);
		console.log("max mobile : " + max_m);
		console.log("ave mobile : " + ave_m);*/
		
		new Chart(ctx, {
		type: 'line',
		data: {
		labels: label,
		datasets: [
			{
			label: 'PC',
			yAxisID: 'A',
			borderColor: '#678184',
			backgroundColor: 'white',
			//data: [53490,78787,98989,8746,12300,12320,22220,19280,29380,120947,123495,12340,18293],
			data: d_pc,
			fill: false
			}, 
			{
			label: 'Mobile',
			yAxisID: 'D',
			borderColor: '#2faebb',
			backgroundColor: 'white',
			data: data_mb,
			fill: false
			}
		]
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
		min: min_p,
		max: max_p,
		stepSize: ave_p,
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
		min: min_m,
		max: max_m,
		stepSize: ave_m,
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
		var submenud = $(".six-acate-open");
        submenud.css(":visible");
        submenud.slideDown();
	}
	
	function check_min(myprice){
		var min = myprice[0];
		
		for(var i = 0; i < myprice.length; i++){
			if(min > myprice[i]){
				min = myprice[i];
			}
		}
		
		
		return min;
	}
	function check_max(myprice){
		var max = 0;
		
		for(var i = 0; i < myprice.length; i++){
			if(max < myprice[i]){
				max = myprice[i];
			}
		}
		
		return max;
	}
	function check_ave(myprice){
		var ave = 0;
		var sum = 0;
		for(var i = 0; i < myprice.length; i++){
			sum += myprice[i];
		}
		ave = sum / 13;
		ave = ave / 10;
		
		return Math.round(ave);
	}
	