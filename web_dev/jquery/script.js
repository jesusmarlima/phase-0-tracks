$(document).ready(function(){

     //array with some photo paths and index variable to control what will be shown
     var index = 0;
     var srcs = ["images/thumb_IMG_1992_1024.jpg","images/thumb_IMG_1186_1024.jpg",
                "images/thumb_IMG_2420_1024.jpg","images/thumb_IMG_1725_1024.jpg",
                "images/thumb_IMG_1194_1024.jpg","images/thumb_IMG_2368_1024.jpg",
                "images/thumb_IMG_2422_1024.jpg","images/thumb_IMG_1633_1024.jpg"]


    // script adds EventListener (click) and change the photos to the left side
     $("#prev").click(function(event){
         index = index - 1;
          if (index < 0){
            index = 7;
          }
        $("#img_master").attr("src",srcs[index])
     });


    // script adds EventListener (click) and change the photos to the right side
      $("#next").click(function(event){
           index = index + 1;
           if (index > srcs.length){
             index = 0;
           }
        $("#img_master").attr("src",srcs[index])
     });

    // script adds EventListeners to change opacity when the mouse pass over the text
    $("#prev").mouseenter(function(event){
        event.target.style.opacity = 1
     });
    $("#prev").mouseleave(function(event){
        event.target.style.opacity = 0.5
     });
    $("#next").mouseenter(function(event){
        event.target.style.opacity = 1
     });
    $("#next").mouseleave(function(event){
        event.target.style.opacity = 0.5
     });
});