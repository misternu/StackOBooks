$(document).ready(function() {

// binding on favorite button
$(".check-img").on("click", function(event) {
  event.preventDefault();
  $postId = $("article > div").attr("id")
  $faveId = $(this).parent().attr("id");
  postFavorite($faveId, $postId);
  // showFavorite($faveId);
})

// binding on upvote button
  $(".vote-img").on("click", function(event) {
    event.preventDefault();
    $respId = $(this).parent().parent().parent().attr("id");
    addVote($respId);
  })

});


function postFavorite(responseId, postId) {
  $.ajax({
    method: "POST",
    url: "/responses/" + responseId + "/favorite/new",
    data: {response_id: responseId, post_id: postId},
    success: function(response) {
      showFavorite($faveId);
      // console.log(response);
    }
  })
}

function showFavorite(id) {
  $("#" + id + " > .check-img").attr("src", "/imgs/check.png");
}


function addVote(voteId) {
  $.ajax({
    method: "Post",
    url: "/posts/votes/new",
    data: {response_id: voteId },
    success: function(response) {
     updateVote(response, voteId);
    }
  })
}

function updateVote(response, id) {
  if (response == "failure") {
    console.log("failed");
  } else {
    $("#" + id + " > div > p .response-vote").html(response["voteTally"]);
  }
}
