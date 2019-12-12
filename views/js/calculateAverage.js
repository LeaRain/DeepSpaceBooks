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

    let averageScore = findAverage(totalScore, countReviews);
    let relativeScore = findRelativeScore(averageScore);

    setAverageReviewScore(averageScore, relativeScore);
}

function setTotalReviews(reviewCount){
    let totalReviews = document.getElementById("totalReviews");
    totalReviews.innerHTML = reviewCount;
}

function findAverage(score, length) {
    let fullResult = score/length;
    // Prevents bad behavior
    return Math.round(fullResult * 100) / 100;
}

function findRelativeScore(absoluteScore){
    let relativeScore = (absoluteScore/5)*100;
    return "width: " + relativeScore + "%";
}

function setAverageReviewScore(averageScore, relativeScore){
    let averageReviewScore = document.getElementById("averageReviewScore");
    let progressbar = document.getElementById("averageProgress");

    // Check for a result of the average score -> there isn't none if there isn't at least one review
    if (!isNaN(averageScore)) {
        averageReviewScore.innerHTML = averageScore;
        progressbar.style = relativeScore;
    }

    else{
        averageReviewScore.innerHTML = "Sorry, this book hasn't been reviewed."
    }

}

