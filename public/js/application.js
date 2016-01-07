$(document).ready(function() {

  $(".vote-img").on("click", function(event) {
    event.preventDefault();
    $respId = $(this).parent().parent().parent().attr("id");
    addVote($respId);
  })

});


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
    $("#" + id + " .response-vote").html(response["voteTally"]);
  }
}
