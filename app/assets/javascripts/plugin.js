$(document).ready(function(){
  $('form.signupform').hide();
  $("#signup").on("click", function(event){
    $('form.loginform').hide();
    $('form.signupform').show();
    $(this).hide();
  });

  $('.vote').on("click", function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    var post = $(this).data('post-id');
    var vote = $(this).data('vote');
    var data = {post_id: post, value: vote};
    $.post(url, data, function(response){
      $('div.score').html('<p>response.score</p>');
    });
  });
});
