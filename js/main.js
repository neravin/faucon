$(document).ready(function () {

    $(document).ready(function () {
        $('#fullpage').fullpage({
            verticalCentered: true,
            anchors: ['Page1', 'Page2', 'Page3', 'Page4'],
    		sectionsColor: ['#000000', '#1eacd7', '#e0382d', '#000000'],
            afterRender: function () {

                //playing the video
                $('video').get(0).play();
            }

        });
    });

    

});
