$(document).ready(function(){   
    
        /* page scroll on click */
        var scroll = function() {   
            $('.page-scroll a').bind('click', function(event) {
                var $anchor = $(this);
                $('html, body').stop().animate({
                    scrollTop: $($anchor.attr('href')).offset().top
                }, 1000, 'easeInOutExpo');
                event.preventDefault();
            });       
        } 
    
        scroll()
            
});
    