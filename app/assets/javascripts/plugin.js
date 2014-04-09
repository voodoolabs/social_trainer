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
    console.log("'" + url + "'")
    var post = $(this).data('post-id');
    console.log(post)
    var vote = $(this).data('vote');
    console.log(vote)
    $.post(url, {value: vote}, function(data, response){
      $('div.score').html(data);
    });
  });
});
