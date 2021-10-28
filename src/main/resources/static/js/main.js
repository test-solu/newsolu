		

	function check_my_keyword() {
		$(".sub-open-fo").hide();
		var mk = $("#check_mk").val();
		$.ajax({
    		type		:	"GET",
    		url			:	"/check_my_keyword",
    		data		:	{keyword:mk},
    		dataType	:	"json",
    		success		:	function(data){
				let_write_mykey(data,mk);
    		},error		:	function(e){
    			alert(e.statusText);
    		}
    	});
	}
	
	function let_write_mykey(data,mk){
		var li_extended = "";
    	$.ajax({
    		type		:	"GET",
    		url			:	"/getExtended",
    		data		:	{keyword:mk},
    		dataType	:	"json",
    		success		:	function(data){
    			var keylist = data.keywordList;
    			for(var i=0; i<keylist.length; i++){
    				li_extended	+= "<li id='bfo_"+i+"' onclick='check_mk_extended("+i+","+keylist.length+")' >" + keylist[i].relKeyword + "</li>";
    			}
    			$("#showHidefo").html(li_extended);
    		},error		:	function(e){
    			alert(e.statusText);
    		}
    	});
		make_key_Competitiveness(data);
	}
	
	function check_mk_extended(seq,end){
    	for(var i = 0; i < end; i++){
    		$("#bfo_"+i).attr("class", "");
    		if(i == seq){
    			$("#bfo_"+i).attr("class", "on five-acate-top");
    		}
    	}
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
    				my_price	+= "<li>" + pc_bi[i].bid.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); + "</li>";
    			}
    			for(var j=0; j<mo_bi.length; j++){
    				my_price_m	+= "<li>" + mo_bi[j].bid.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); + "</li>";
    			}
    			$("#td_inner_check").html(my_price);
    			$("#td_inner_check_m").html(my_price_m);
    		},error		:	function(e){
    			console.log(e.statusText);
    		}
    	});
    	var submenuf = $(".five-acate-open");
        submenuf.css(":visible");
        submenuf.slideDown();
    }
    
    function make_key_Competitiveness(data){
		var my_key = data[0];
		console.log(my_key);
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
		var submenud = $(".four-acate-open");
        submenud.css(":visible");
        submenud.slideDown();
	}