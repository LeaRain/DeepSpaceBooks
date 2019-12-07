document.addEventListener("DOMContentLoaded", function() {
    tabInteraction();
});

function tabInteraction() {
    let keywordStatusID = document.getElementById("keywordSearchID");
    let detailStatusID = document.getElementById("detailSearchID");

    keywordStatusID.addEventListener("click", setFocusKeyword);
    detailStatusID.addEventListener("click", setFocusDetail);
}

function setFocusKeyword(){
    let keywordStatus = document.getElementById("keywordSearch");
    let keywordReference = document.getElementById("keywordSearchIDA");
    let detailStatus = document.getElementById("detailSearch");
    let detailReference = document.getElementById("detailSearchIDA");

    keywordStatus.className = "tab-pane fade active show";
    keywordReference.className = "nav-link active";
    detailStatus.className = "tab-pane fade";
    detailReference.className = "nav-link";
}

function setFocusDetail(){
    let keywordStatus = document.getElementById("keywordSearch");
    let keywordReference = document.getElementById("keywordSearchIDA");
    let detailStatus = document.getElementById("detailSearch");
    let detailReference = document.getElementById("detailSearchIDA");

    keywordStatus.className = "tab-pane fade";
    keywordReference.className = "nav-link";
    detailStatus.className = "tab-pane fade active show";
    detailReference.className = "nav-link active";


}