<?php
require_once 'core/Init.php';
$user = new User();

$colours = array('007AFF','FF7000','FF7000','15E25F','CFC700','CFC700','CF1100','CF00BE','F00');
$user_colour = array_rand($colours);
?>
<script language="javascript" type="text/javascript">
    $(document).ready(function(){
        //create a new WebSocket object.
        var wsUri = "ws://199.188.203.97:9000/includes/server.php";
        websocket = new WebSocket(wsUri);

        websocket.onopen = function(ev) { // connection is open
            $('#message_box').append("<div class=\"system_msg\">Connected!</div>"); //notify user
        }

        $('#chatform').submit(function(event){ //if user clicks message send button
            event.preventDefault();
            var mymessage = $('#message').val(); //get message text
            var myname = '<?php echo $user->data()->username; ?>'; //get user name

            if(mymessage == ""){ //emtpy message?
                alert("Enter Some message Please!");
                return;
            }

            //prepare json data
            var msg = {
                message: mymessage,
                name: myname,
                color : '<?php echo $colours[$user_colour]; ?>'
            };
            //convert and send data to server
            websocket.send(JSON.stringify(msg));
        });

        //#### Message received from server?
        websocket.onmessage = function(ev) {
            var msg = JSON.parse(ev.data); //PHP sends Json data
            var type = msg.type; //message type
            var umsg = msg.message; //message text
            var uname = msg.name; //user name
            var ucolor = msg.color; //color

            if(type == 'usermsg')
            {
                $('#message_box').append("<div><span class=\"user_name\" style=\"color:#"+ucolor+"\">"+uname+"</span> : <span class=\"user_message\">"+umsg+"</span></div>");
            }
            if(type == 'system')
            {
                $('#message_box').append("<div class=\"system_msg\">"+umsg+"</div>");
            }

            $('#message').val(''); //reset text
        };

        websocket.onerror	= function(ev){$('#message_box').append("<div class=\"system_error\">Error Occurred - "+ev.data+"</div>");};
        websocket.onclose 	= function(ev){$('#message_box').append("<div class=\"system_msg\">Connection Closed</div>");};
    });
</script>
<div id="chat" class="fixed" data-current-user="<?php echo $user->data()->username; ?>" data-order-by-status="1" data-max-chat-history="25">

    <!-- conversation template -->
    <div class="chat-outer">
        <div class="message_box" id="message_box" style="background-color: #fff;padding: 10px;margin-bottom: 10px;margin-left: 10px;height: 90%;"></div>
        <form id="chatform">
            <input type="text" name="message" id="message" placeholder="Message" maxlength="80" autocomplete="off" style="width: 95%;margin-left: 10px;padding: 2px;" />
            <input type="submit" class="btn btn-info" value="Send">
        </form>
    </div>
    <div id="chatinner">
        <?php include("chatInner.php"); ?>
    </div>
</div>
</div>
</div>