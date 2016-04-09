function switchLoader() {
    //alert('Loading...');

    var delayVar = setTimeout(showPage, 3000);
}

function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("mainDiv").style.display = "block";
    //alert("hello");
}
