document.addEventListener("DOMContentLoaded", function(){
    calculateAverage();
});

function calculateAverage(){
    // All elements have the class reviewScore because that's more easy to handle than the classes
    let reviewScore = document.getElementsByClassName("reviewScore");
    let countReviews = reviewScore.length;
    let totalScore = 0;

    setTotalReviews(countReviews);

    for (countReviews = 0; countReviews < reviewScore.length; countReviews++){
        // Cast to integer required (prevents concatenated string)
        totalScore += parseInt(reviewScore[countReviews].innerHTML);
    }

    // TODO: Set average in pug
    findAverage(totalScore, countReviews)
}

function setTotalReviews(reviewCount){
    let totalReviews = document.getElementById("totalReviews");
    totalReviews.innerHTML = reviewCount;
}

function findAverage(score, length) {
    return (score/length);
}


