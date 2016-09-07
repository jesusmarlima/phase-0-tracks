$(document).ready(function(){

     var index = 0;
     var srcs = ["images/thumb_IMG_1992_1024.jpg","images/thumb_IMG_1186_1024.jpg",
                "images/thumb_IMG_2420_1024.jpg","images/thumb_IMG_1725_1024.jpg",
                "images/thumb_IMG_1194_1024.jpg","images/thumb_IMG_2368_1024.jpg",
                "images/thumb_IMG_2422_1024.jpg","images/thumb_IMG_1633_1024.jpg"]


     $("#prev").click(function(event){
         index = index - 1;
          if (index < 0){
            index = 7;
          }
        $("#img_master").attr("src",srcs[index])
     });

      $("#next").click(function(event){
           index = index + 1;
           if (index > srcs.length){
             index = 0;
           }
        $("#img_master").attr("src",srcs[index])
     });
});