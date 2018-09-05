function readText(){
    jQuery.ajax({
        url : "irc2bc.txt",
        dataType: "text",
        success : function (data) {
            var lines = data.split('\n'),
                htmlLines = '<p>' + lines.join('</p><p>') + '</p>';

            jQuery("#showtxt").html(htmlLines);
            setTimeout( readText, 1000 );
        }
    });
}

jQuery(document).ready(function() {
    readText();
});