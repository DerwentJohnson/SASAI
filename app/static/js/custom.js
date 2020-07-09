function submit_message(message){
    $.post("/send_message", {message:message},handle_response);

    function handle_response(data){
        $('.body').append(`
        <div class="bot d-flex justify-content-start align-items-center mb-2">
            <!-- <img src="../img/b3.jpg" alt="" style="height:50px;" class="mr-3"> -->
            <div class="bg-skyBlueCrayola px-2" id="talkbubble">
                <p class="text-gray mb-1">${data.message}</p>
                <p class="time text-right text-white font-weight-bod mb-1" id="time">${time}</p>
            </div>
        </div>
        `)
    }
}
 var dt = new Date();
 time = document.getElementById("time").innerHTML = dt.toLocaleTimeString();
function updateScroll() {
     var element = document.getElementById("body");
      element.scrollTop = element.scrollHeight;
 }
 updateScroll();

$('#target').on('submit', function(e){
    e.preventDefault();
    const input_message = $('#input-message').val()
    console.log(input_message)
    // return if the user does not enter any text
    if (!input_message) {
      return
    }

    $('.body').append(`
    <div class="user d-flex justify-content-end align-items-center mb-3">
    <div class="bg-skyBlueCrayola px-2" id="talkbubble2">
        <p class="text-white mb-1">${input_message}</p>
        <p class="time text-right text-white font-weight-bod mb-1" id="time">${time}</p>
    </div>
    </div>
    `)
    // clear the text input 
    $('#input_message').val('')

    // send the message
    submit_message(input_message)
});
