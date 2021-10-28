
        
        $(window).resize(function(){ if (window.innerWidth < 1000) { 
        

            $(document).ready(function() {

                $('#bon').click(function () {
                    if ($('#showHideon').is(":hidden")) {
                    $('#showHideon').animate({"height": "400px"}, "medium");
                    } else {
                    $('#showHideon').animate({"height": "40px"}, "medium");  
                    $('#showHideon').css({"overflow": "hidden"});
                    }
                });
                $('#aon').click(function () {
                    if ($('#showHideon').is(":hidden")) {
                    $('#showHideon').animate({"height": "40px"}, "medium");
                    } else {
                    $('#showHideon').animate({"height": "351px"}, "medium");   
                    }
                });
    
    
                $('#btw').click(function () {
                    if ($('#showHidetw').is(":hidden")) {
                    $('#showHidetw').animate({"height": "400px"}, "medium");
                    } else {
                    $('#showHidetw').animate({"height": "40px"}, "medium");
                    $('#showHidetw').css({"overflow": "hidden"});
                    }
                });
                $('#atw').click(function () {
                    if ($('#showHidetw').is(":hidden")) {
                    $('#showHidetw').animate({"height": "40px"}, "medium");
                    } else {
                    $('#showHidetw').animate({"height": "390px"}, "medium");
                    }
                });
    
    
                $('#bth').click(function () {
                    if ($('#showHideth').is(":hidden")) {
                    $('#showHideth').animate({"height": "400px"}, "medium");
                    } else {
                    $('#showHideth').animate({"height": "40px"}, "medium");  
                    $('#showHideth').css({"overflow": "hidden"});
                    }
                });
                $('#ath').click(function () {
                    if ($('#showHideth').is(":hidden")) {
                    $('#showHideth').animate({"height": "40px"}, "medium");
                    } else {
                    $('#showHideth').animate({"height": "390px"}, "medium");
                    }
                });
        
    
                $('#bfo').click(function () {
                    if ($('#showHidefo').is(":hidden")) {
                    $('#showHidefo').animate({"height": "400px"}, "medium");
                    } else {
                    $('#showHidefo').animate({"height": "40px"}, "medium");
                    $('#showHidefo').css({"overflow": "hidden"});
                    }
                });
                $('#afo').click(function () {
                    if ($('#showHidefo').is(":hidden")) {
                    $('#showHidefo').animate({"height": "40px"}, "medium");
                    } else {
                    $('#showHidefo').animate({"height": "390px"}, "medium"); 
                    }
                });
            });
    



        } else {  } }).resize();
