
        
        $(window).resize(function(){ if (window.innerWidth < 1000) { 
        

            $(document).ready(function() {

                $('#bon').click(function () {
                    if ($('#showHideon').is(":hidden")) {
                    $('#showHideon').animate({"height": "400px"}, "medium");
                    $('#showHideon').removeClass("stop-scroll");
                    } else {
                    $('#showHideon').animate({"height": "40px"}, "medium");  
                    $('#showHideon').addClass("stop-scroll");
                    }
                });
                $('#aon').click(function () {
                    if ($('#showHideon').is(":hidden")) {
                    $('#showHideon').animate({"height": "40px"}, "medium");
                    $('#showHideon').addClass("stop-scroll");
                    } else {
                    $('#showHideon').animate({"height": "351px"}, "medium");   
                    $('#showHideon').removeClass("stop-scroll");
                    }
                });
    
    
                $('#btw').click(function () {
                    if ($('#showHidetw').is(":hidden")) {
                    $('#showHidetw').animate({"height": "400px"}, "medium");
                    $('#showHidetw').removeClass("stop-scroll");
                    } else {
                    $('#showHidetw').animate({"height": "40px"}, "medium");
                    $('#showHidetw').addClass("stop-scroll");
                    }
                });
                $('#atw').click(function () {
                    if ($('#showHidetw').is(":hidden")) {
                    $('#showHidetw').animate({"height": "40px"}, "medium");
                    $('#showHidetw').addClass("stop-scroll");
                    } else {
                    $('#showHidetw').animate({"height": "390px"}, "medium");
                    $('#showHidetw').removeClass("stop-scroll");
                    }
                });
    
    
               $('#bth').click(function () {
                    if ($('#showHideth').is(":hidden")) {
                    $('#showHideth').animate({"height": "400px"}, "medium");
                    $('#showHideth').removeClass("stop-scroll");
                    } else {
                    $('#showHideth').animate({"height": "40px"}, "medium");  
                    $('#showHideth').addClass("stop-scroll");
                    }
                });
                $('#ath').click(function () {
                    if ($('#showHideth').is(":hidden")) {
                    $('#showHideth').animate({"height": "40px"}, "medium");
                    $('#showHideth').addClass("stop-scroll");
                    } else {
                    $('#showHideth').animate({"height": "390px"}, "medium");
                    $('#showHideth').removeClass("stop-scroll");
                    }
                });
        
    
               $('#bfo').click(function () {
                    if ($('#showHidefo').is(":hidden")) {
                    $('#showHidefo').animate({"height": "400px"}, "medium");
                    $('#showHideth').removeClass("stop-scroll");
                    } else {
                    $('#showHidefo').animate({"height": "40px"}, "medium");
                    $('#showHidefo').addClass("stop-scroll");
                    }
                });
                $('#afo').click(function () {
                    if ($('#showHidefo').is(":hidden")) {
                    $('#showHidefo').animate({"height": "40px"}, "medium");
                    $('#showHideth').addClass("stop-scroll");
                    } else {
                    $('#showHidefo').animate({"height": "390px"}, "medium"); 
                    $('#showHideth').removeClass("stop-scroll");
                    }
                });
            });
    



        } else {  } }).resize();
