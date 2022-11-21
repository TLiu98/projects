
$(document).ready(function () {
    $('.addnum').click(function () {
        var temp=$(this).prev().val();
        temp++;
        $(this).prev().attr('value',temp);
    });
    $('.minnum').click(function () {
        var temp1=$(this).next().val();
        temp1--;
        if (temp1 <= 0){
            alert("至少选择一件商品");
        }
        else {
            $(this).next().attr('value', temp1);
        }
    });



// $('.addnum:eq()').click(function () {
//     //var t = $("#num");
//     //t.val(parseInt(t.val())+1)
//     var index = $('.addnum').val();
//     // alert(index);
//     // for (var i = 0; i < 3; i++) {
//         $('.booknum:eq(i)').attr('value',10);
//
//     console.log("======");
//     // var temp=$('ul#box li:eq(0) #ii #i').html();
//     var temp=$('.aaaaaaaaa:eq(0)').html();
//     // alert(temp);
//     console.log(temp);
//     console.log("=========");
// })
});

function jisuan(obj) {

    var total = 0;

    var books = document.getElementsByName("book");
    var nums = document.getElementsByName("count");
    for (var index = 0; index < books.length; index++) {

        if (books[index].checked) {
            total += parseFloat(books[index].value) * parseFloat(nums[index].value);
            total.toFixed(2);
        }

    }
    myspan.innerHTML = total + "元";
}

window.onload = function () {
    var obox = document.getElementById("box");

    var inputs = obox.getElementsByTagName("input");

    for (var index = 0; index < inputs.length; index++) {

        inputs[index].onclick = function () {

            jisuan(this);
            b.checked = false;
        }
    }
    var b = document.getElementById("btu");
    var iSelect=true;
    b.onclick=function(){
        var nums = document.getElementsByName("count");
        var books = document.getElementsByName("book");
        console.log(books.length);
        console.log(iSelect);
        var total = 0;
        if(iSelect==true){
            for(var i=0;i<books.length;i++){
                console.log("books");
                console.log(books);
                console.log(books[i].value);
                console.log(inputs[i].checked);
                if (books[i].checked == false) {
                    books[i].checked = true;
                }
                total += parseFloat(books[i].value) * parseFloat(nums[i].value);
                total.toFixed(2);
            }
            iSelect=false;
            myspan.innerHTML = total + "元";
        }else if(iSelect==false){
            for(var i=0;i<books.length;i++){
                if (books[i].checked == true) {
                    books[i].checked = false;
                }
            }
            iSelect=true;
            myspan.innerHTML = 0.0 + "元";
        }
    }
}